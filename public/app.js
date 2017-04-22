  function add_to_cart(id)
  {
    var key = 'product_'+id;
    var x = window.localStorage.getItem(key); //x = hh['key'], x-string type, получаем значение по ключу
    x = x * 1 + 1; //x = x + 1, x*1 - make x from string to integer
    window.localStorage.setItem(key, x); //hh['key'] = x
  }
  
  function cart_get_number_of_items()
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