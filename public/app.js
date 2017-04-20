  function add_to_cart(id)
  {
    var key = 'product_'+id;
    var x = window.localStorage.getItem(key); //x = hh['key'], x-string type
    x = x * 1 + 1; //x = x + 1, x*1 - make x from string to integer
    window.localStorage.setItem(key, x); //hh['key'] = x
  } 