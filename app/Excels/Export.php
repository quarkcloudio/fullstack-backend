<?php

namespace App\Excels;

use App\Invoice;
use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;

class Export implements FromArray,WithHeadings,ShouldAutoSize,WithColumnFormatting
{
    protected $lists,$headings,$columnFormats;

    public function __construct(array $lists,array $headings,array $columnFormats = [])
    {
        $this->lists = $lists;
        $this->headings = $headings;
        $this->columnFormats = $columnFormats;
    }

    public function headings(): array
    {
        return $this->headings;
    }

    /**
     * @return array
     */
    public function columnFormats(): array
    {
        $this->columnFormats;

        $columnFormats = [];

        foreach ($this->columnFormats as $key => $value) {
            if($value == 'FORMAT_DATE_DDMMYYYY') {
                $columnFormats[$key] = NumberFormat::FORMAT_DATE_DDMMYYYY;
            }
            if($value == 'FORMAT_NUMBER_00') {
                $columnFormats[$key] = NumberFormat::FORMAT_NUMBER_00;
            }
            if($value == 'FORMAT_TEXT') {
                $columnFormats[$key] = NumberFormat::FORMAT_TEXT;
            }
        }

        return $columnFormats;
    }

    public function array(): array
    {
        return $this->lists;
    }
}