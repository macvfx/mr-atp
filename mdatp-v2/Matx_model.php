<?php

use munkireport\models\MRModel as Eloquent;

class Matx_model extends Eloquent
{
    protected $table = 'Matx';

    protected $fillable = [
      'serial_number',
      'item1',
      'item2',
      'item3',
      'item4',
      'item5',
    ];
}
