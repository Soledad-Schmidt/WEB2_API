<?php

class SockModel {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_socks;charset=utf8', 'root', '');
    }

    public function getAll($orderBy, $order, $limit, $page, $column, $filtervalue){
        $params = []; 
        $consulta = ('SELECT br.*,so.*
                    FROM brand br
                    INNER JOIN sock so
                    ON br.id_brand = so.id_brand'); 

        if($column != null){
            $consulta .= " WHERE  $column = ?";
            array_push($params, $filtervalue);
        }

        if($orderBy != null){
            $consulta .= " ORDER BY $orderBy";     
        }

        if($order != null){
            $consulta .= " $order";
        }

        if($page == null){
            $page=1;
        }

        if(($page != null)&&($limit != null)){
            $offset=($page-1)*$limit;
            $consulta .= " LIMIT  $limit OFFSET $offset";
        }

        $query = $this->db->prepare($consulta);
        $query->execute($params);
        $socks = $query->fetchAll(PDO::FETCH_OBJ); 
        return $socks;
}
 

    public function getSock($id_sock) {
        $query = $this->db->prepare('SELECT br.*, so.*
                                    FROM brand br
                                    INNER JOIN sock so
                                    ON br.id_brand = so.id_brand
                                    WHERE id_sock=?');
        $query->execute([$id_sock]);
        $sock = $query->fetch(PDO::FETCH_OBJ);
        
        return $sock;
    }

    public function insert($model, $color, $size, $price, $id_brand, $sale) {
        $query = $this->db->prepare("INSERT INTO sock (model, color, size, price, id_brand, sale) 
                                    VALUES (?, ?, ?, ?, ?, ?)");
        $query->execute([$model, $color, $size, $price, $id_brand, $sale]);

        return $this->db->lastInsertId();
    }

    public function updateSock( $id_sock, $model, $color, $size, $price, $brand, $sale) {
        $query = $this->db->prepare('UPDATE sock 
                                    SET model=?, color=?, size=?, price=?, id_brand=?, sale=?
                                    WHERE id_sock=?');
        $query->execute([$model, $color, $size, $price, $brand, $sale, $id_sock]);
    }

}