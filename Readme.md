
ENDPOINT = socks

*Obtener todos los productos (medias): 
    Method: GET
    URL: http://localhost/WEB2/WEB_API/api/socks 

*Obtener una media por su id: 
    Method: GET 
    URL: http://localhost/WEB2/WEB2_API/api/socks/id
    Ejemplo: http://localhost/WEB2/WEB2_API/api/socks/3

*Paginar todos los productos (medias): 
    Method: GET
    URL: http://localhost/WEB2/WEB2_API/api/socks?page=3&limit=2

*Obtener un producto filtrado por columna:
    Method: GET
    Ejemplos URL
    model: http://localhost/WEB2/WEB2_API/api/socks?model=flores 
    color: http://localhost/WEB2/WEB2_API/api/socks?color=azul 
    size: http://localhost/WEB2/WEB2_API/api/socks?size=2 
    price: http://localhost/WEB2/WEB2_API/api/socks?price=500 
    name(nombre de la marca): http://localhost/WEB2/WEB2_API/api/socks?name=Adidas
    sale= http://localhost/WEB2/WEB2_API/api/socks?sale=si

    En cuanto al campo "size" se admiten los valores 1, 2 o 3.
    En cuanto al campo "name" se admiten solo los valores Elemento, Adidas, Pirulo y Floyd, los cuales hacen referancia a las marcas disponibles.
    En cuanto al campo "sale" los valores permitidos son si o no, lo cual indica que productos se encuentran en oferta (si) y cuales no (no).

*Obtener una columna ordenada de manera ascendente: 
    Method: GET
    Ejemplo URL: http://localhost/WEB2/WEB2_API/api/socks?orderBy=price&order=asc

*Obtener una columna ordenada de manera descendente: 
    Method: GET
    Ejemplo URL: http://localhost/WEB2/WEB2_API/api/socks?orderBy=size&order=desc

*Insertar un nuevo producto:
    Method: POST
    Ejemplo URL: http://localhost/WEB2/WEB2_API/api/insertsock
    Para insertar un nuevo producto en la db, es necesario escribir en formato JSON el producto a insertar de la siguiente manera:
    {
    "model":"mundial22",
    "color":"azul",
    "size":"3",
    "price":"150",
    "id_brand":"3",
    "sale":"no"
    }
    En cuanto al campo "size" se admiten los valores 1, 2 o 3.
    En cuanto al campo "id_brand" se admiten solo los valores 1, 2, 3 y 4 correspondientes a las marcas Elemento, Adidas, Pirulo, Floyd respectivamente.
   En cuanto al campo "sale" los valores permitidos son si o no, lo cual indica si el producto se encuentra en oferta (si) o no (no).

*Editar un producto de la db:
    Method: PUT
    URL: http://localhost/WEB2/WEB2_API/api/updatesock/id
    En este caso vamos a tener que conocer el id del producto que deseamos modificar e incluírlo en la URL de la siguiente manera: http://localhost/WEB2/WEB2_API/api/updatesock/16
    Para modificar un producto de la db, es necesario escribir en formato JSON el producto a insertar de la siguiente manera:
     {
    "model":"mundial22",
    "color":"rojo",
    "size":"2",
    "price":"300",
    "id_brand":"4",
    "sale":"si"
    }
    En cuanto al campo "size" se admiten los valores 1, 2 o 3.
    En cuanto al campo "id_brand" se admiten solo los valores 1, 2, 3 y 4 correspondientes a las marcas Elemento, Adidas, Pirulo, Floyd respectivamente.
    En cuanto al campo "sale" los valores permitidos son si o no.
