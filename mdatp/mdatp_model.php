<?php

use munkireport\app\models\MRModel as Eloquent;

class mdatp_model extends Eloquent
{
    protected $table = 'mdatp';

    protected $fillable = [
      'serial_number',
      'item1',
      'item2',
    ];

    public $timestamps = false;

}
