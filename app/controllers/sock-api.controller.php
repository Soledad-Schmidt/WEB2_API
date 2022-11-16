<?php
require_once './app/models/sock-api.model.php';
require_once './app/views/sock-api.view.php';

class SockApiController {
    private $model;
    private $view;
    private $data;

    public function __construct() {
        $this->model = new SockModel();
        $this->view = new ApiView();
        
        // lee el body del request
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }
 
    public function getAllSocks() {                
        $orderBy = $_GET["orderBy"] ?? null;
        $order = $_GET["order"] ?? null;
        $limit = $_GET["limit"] ?? null;
        $page =  $_GET["page"] ?? null;
        $column =  $_GET["column"] ?? null; 
        $filtervalue = $_GET["filtervalue"] ?? null;
        $columns = [
            "id_sock" => "id_sock",
            "model" => "model",
            "color" => "color",
            "size" => "size",
            "price" => "price",
            "id_brand" => "id_brand",
            "sale" => "sale",
            "name" => "name"

        ];

        foreach ($_GET as $key => $value) {
    
            if(in_array(strtolower($key), $columns)){
                $column = $columns[strtolower ($key)];
                $filtervalue = $value;    
            }
            
            $socks = $this->model->getAll($orderBy, $order, $limit, $page, $column, $filtervalue);

            if($socks)
                return $this->view->response($socks, 200);
            else
                $this->view->response("NOT FOUND", 404);
        }
    } 


    public function getSock($params = null) {
        // obtengo el id del arreglo de params
        $id_sock = $params[':ID'];
       
        $sock = $this->model->getSock($id_sock);
       
        // si no existe devuelvo 404
        if (!empty($sock))
            $this->view->response($sock);
        else 
            $this->view->response("El producto con el id = $id_sock no existe", 404);
    }


    public function insertSock($params = null){
        $sock = $this->getData();

        if (empty($sock->model) || empty($sock->color) || empty($sock->size) || 
            empty($sock->price) || empty($sock->id_brand) || empty($sock->sale)) {
            $this->view->response("Complete los datos", 400);
        } else {
            $id_sock = $this->model->insert($sock->model, $sock->color, $sock->size,
                                $sock->price, $sock->id_brand, $sock->sale);
           
            $this->view->response("El producto se insertó con éxito, con el id=$id_sock.", 201);
        }

    }

    public function updateSock($params = null){
        $id_sock = $params[':ID'];
        $sock = $this->model->getSock($id_sock);

        if ($sock){
            $body = $this->getData();
            $model = $body->model;
            $color = $body->color;
            $size = $body->size;
            $price = $body->price;
            $brand = $body->id_brand;
            $sale = $body->sale;
            $id_sock = $body->id_sock;
            $this->model->updateSock($id_sock, $model, $color, $size, $price, $brand, $sale);
            
            $this->view->response("El producto con id = $id_sock ha sido actualizado con éxito", 200);
            $new = $this->model->getSock($id_sock);
            $this->view->response($new);
            }
            else
            $this->view->response("El producto con id = $id_sock no existe.", 404);
            
    }
}