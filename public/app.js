  function add_to_cart(id) //формируем заказ из localStorage ввиде хэша
  {
    var key = 'product_'+id;
    var x = window.localStorage.getItem(key); //x = hh['key'], x-string type, получаем значение по ключу
    x = x * 1 + 1; //x = x + 1, x*1 - make x from string to integer
    window.localStorage.setItem(key, x); //hh['key'] = x
    
    update_orders_input();
    update_orders_button();
  }
  
  function cart_get_number_of_items() //получаем количество товаров по ключу
  {
    var cnt = 0;
    for(var i = 0; i < window.localStorage.length; i++)
    {
      var key = window.localStorage.key(i); //получаем ключ
      var value = window.localStorage.getItem(key); //получаем значение по ключу
      
      if(key.indexOf('product_') == 0) //если ключ начинается c 'product_'
      {
        cnt = cnt + value * 1; //счетчик товаров по ключам
      }
    }
    return cnt;
  }
  
  function update_orders_input() //получаем заказ и отправляем в форму с id = "orders_input"
  {
    var orders = cart_get_orders();
    $('#orders_input').val(orders);
  }
  
  function update_orders_button() //получаем количество товаров и тправляем в форму с id = "orders_button"
  {
    var text = 'Cart (' + cart_get_number_of_items() + ')';
    $('#orders_button').val(text);
  }

  function cart_get_orders() //собираем заказ из localStorage в orders
  {
    var orders = '';
    for(var i = 0; i < window.localStorage.length; i++)
    {
      var key = window.localStorage.key(i); //получаем ключ
      var value = window.localStorage.getItem(key); //получаем значение по ключу
      
      if(key.indexOf('product_') == 0) //если ключ начинается c 'product_'
      {
        orders = orders + key + '=' + value + ',';
      }
    }
    return orders;
  }
  
  function clear_cart() //Очистить корзину
  {
    window.localStorage.clear();
    update_orders_button();
  }