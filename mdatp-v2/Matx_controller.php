<?php

/**
 * Matx class
 *
 * @package munkireport
 * @author
 **/
class Matx_controller extends Module_controller
{

    /*** Protect methods with auth! ****/
    function __construct()
    {
        // Store module path
        $this->module_path = dirname(__FILE__);
    }

    /**
     * Get Matx information for serial_number
     *
     * @param string $serial serial number
     **/
    public function get_data($serial_number = '')
    {

        if (! $this->authorized()) {
            view('json', array('msg' => 'Not authorized'));
        }
        $columns = [
            'item1',
            'item2',
						'item3',
						'item4',
						'item5',
        ];

        $out = Matx_model::select($columns)
            ->whereSerialNumber($serial_number)
            ->filter()
            ->limit(1)
            ->first()
            ->toArray();

        view('json', array('msg' => $out));
    }

    public function get_list()
    {
        $out = Matx_model::selectRaw('item1, count(*) AS count')
            ->filter()
            ->groupBy('item1')
            ->orderBy('count', 'desc')
            ->get()
            ->toArray();

        view('json', array('msg' => $out));
}

} // END class Matx_controller
