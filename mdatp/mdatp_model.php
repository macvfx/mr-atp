<?php

use munkireport\models\MRModel as Eloquent;

class Mdatp_model extends Eloquent
{
    protected $table = 'mdatp';

    protected $fillable = [
      'serial_number',
      'item1',
      'item2',
    ];

    public $timestamps = false;

}
