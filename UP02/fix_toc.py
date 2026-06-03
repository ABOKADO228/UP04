"""
Исправляет документ Петренко_new.docx:
1. Добавляет записи оглавления для разделов 2-5, ЗАКЛЮЧЕНИЕ, СПИСОК, ПРИЛОЖЕНИЙ А/Б/В
2. Добавляет outlineLvl=0 к заголовкам разделов 2-5 и ПРИЛОЖЕНИЙ
   (чтобы Word мог обновить оглавление по F9)
"""

import re
import os

DOC_XML = r"D:\Development\Projects\UP04\UP02\unpacked_fix\word\document.xml"

# ─────────────────────────────────────────────
# 1. Новые записи оглавления
# ─────────────────────────────────────────────
# Стиль "21" = TOC-уровень 2 (как "1 Техническое задание")
# Стиль "11" = TOC-уровень 1 (как ВВЕДЕНИЕ, ЗАКЛЮЧЕНИЕ)

TOC_L2_TPL = '''\
        <w:p w14:paraId="{pid}" w14:textId="77777777" w:rsidR="00AA0001" w:rsidRDefault="00AA0001">
          <w:pPr>
            <w:pStyle w:val="21"/>
            <w:tabs>
              <w:tab w:val="right" w:leader="dot" w:pos="9345"/>
            </w:tabs>
            <w:rPr>
              <w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/>
              <w:noProof/>
              <w:sz w:val="24"/>
              <w:szCs w:val="24"/>
            </w:rPr>
          </w:pPr>
          <w:r>
            <w:rPr>
              <w:rStyle w:val="ae"/>
              <w:noProof/>
            </w:rPr>
            <w:t>{title}</w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:noProof/>
              <w:webHidden/>
            </w:rPr>
            <w:tab/>
            <w:t>{page}</w:t>
          </w:r>
        </w:p>'''

TOC_L1_TPL = '''\
        <w:p w14:paraId="{pid}" w14:textId="77777777" w:rsidR="00AA0001" w:rsidRDefault="00AA0001">
          <w:pPr>
            <w:pStyle w:val="11"/>
            <w:tabs>
              <w:tab w:val="right" w:leader="dot" w:pos="9345"/>
            </w:tabs>
            <w:rPr>
              <w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/>
              <w:noProof/>
              <w:sz w:val="24"/>
              <w:szCs w:val="24"/>
            </w:rPr>
          </w:pPr>
          <w:r>
            <w:rPr>
              <w:rStyle w:val="ae"/>
              <w:noProof/>
            </w:rPr>
            <w:t>{title}</w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:noProof/>
              <w:webHidden/>
            </w:rPr>
            <w:tab/>
            <w:t>{page}</w:t>
          </w:r>
        </w:p>'''

_pid = 0x2000

def make_pid():
    global _pid
    _pid += 1
    return f"{_pid:08X}"


def toc_entry(title, page, level=2):
    tpl = TOC_L2_TPL if level == 2 else TOC_L1_TPL
    return tpl.format(pid=make_pid(), title=title, page=str(page))


# Записи для добавления (title, page, TOC-level)
NEW_TOC_ENTRIES = [
    ("2 Описание алгоритма решения задачи",    19, 2),
    ("3 UML-диаграммы Use Case и компонентов", 24, 2),
    ("4 Структура проекта",                    32, 2),
    ("5 Тестирование",                         38, 2),
    ("ЗАКЛЮЧЕНИЕ",                             40, 1),
    ("СПИСОК ИСПОЛЬЗУЕМЫХ ИСТОЧНИКОВ",         41, 1),
    ("ПРИЛОЖЕНИЕ А",                           43, 1),
    ("ПРИЛОЖЕНИЕ Б",                           51, 1),
    ("ПРИЛОЖЕНИЕ В",                           59, 1),
]

# ─────────────────────────────────────────────
# 2. Параграфы, которым нужен outlineLvl=0
#    Ищем по уникальным текстам заголовков
# ─────────────────────────────────────────────
OUTLINE_HEADINGS = [
    "2 Описание алгоритма решения задачи",
    "3 UML-диаграммы Use Case и компонентов приложения",
    "4 Структура проекта",
    "5 Тестирование",
    "ПРИЛОЖЕНИЕ А",
    "ПРИЛОЖЕНИЕ Б",
    "ПРИЛОЖЕНИЕ В",
]


def add_outline_lvl(doc, heading_text):
    """Добавляет <w:outlineLvl w:val="0"/> в pPr параграфа с данным текстом."""
    idx = doc.find(heading_text)
    if idx == -1:
        print(f"  ВНИМАНИЕ: не найден заголовок: {heading_text!r}")
        return doc

    # Находим начало параграфа
    para_start = doc.rfind("<w:p ", 0, idx)
    para_end   = doc.find("</w:p>", idx) + 6
    para       = doc[para_start:para_end]

    # Уже есть outlineLvl?
    if "outlineLvl" in para:
        return doc

    # Вставляем перед закрывающим </w:pPr>
    if "</w:pPr>" not in para:
        print(f"  ВНИМАНИЕ: нет </w:pPr> у: {heading_text!r}")
        return doc

    new_para = para.replace(
        "</w:pPr>",
        "        <w:outlineLvl w:val=\"0\"/>\n        </w:pPr>",
        1,
    )
    return doc[:para_start] + new_para + doc[para_end:]


def main():
    with open(DOC_XML, encoding="utf-8") as f:
        doc = f.read()

    # ── Шаг 1: добавляем outlineLvl к заголовкам ──────────────────────────────
    print("Добавляем outlineLvl...")
    for heading in OUTLINE_HEADINGS:
        doc = add_outline_lvl(doc, heading)
        print(f"  OK: {heading}")

    # ── Шаг 2: добавляем записи TOC ──────────────────────────────────────────
    # Находим параграф с <w:fldChar w:fldCharType="end"/> который закрывает TOC
    # Он идёт после последней записи 1.7

    # Маркер: текст последней записи TOC
    last_entry_text = "1.7 Порядок контроля и приёмки"
    idx = doc.find(last_entry_text)
    if idx == -1:
        raise RuntimeError("Не найдена последняя запись оглавления")

    # Конец параграфа с последней записью
    end_of_last = doc.find("</w:p>", idx) + 6

    # Следующий параграф — это параграф с fldChar end
    fld_end_para_start = doc.find("<w:p ", end_of_last)
    if fld_end_para_start == -1:
        raise RuntimeError("Не найден параграф конца поля TOC")

    # Генерируем новые записи
    new_entries_xml = "\n".join(
        toc_entry(title, page, level)
        for title, page, level in NEW_TOC_ENTRIES
    )

    # Вставляем перед параграфом с fldChar end
    doc = doc[:fld_end_para_start] + new_entries_xml + "\n" + doc[fld_end_para_start:]

    print(f"\nДобавлено {len(NEW_TOC_ENTRIES)} записей в оглавление")

    with open(DOC_XML, "w", encoding="utf-8") as f:
        f.write(doc)

    print("Файл сохранён:", DOC_XML)


if __name__ == "__main__":
    main()
