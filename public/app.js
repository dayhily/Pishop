  function something()
  {
    var x=window.localStorage.getItem('aaa'); //x = hh['aaa'], x-string type
    x = x * 1 + 1; //x = x + 1, x*1 - make x from string to integer
    window.localStorage.setItem('aaa',x); //hh['aaa'] = x
         
    alert(x); 
  }
  
  function add_to_cart(id)
  {
    alert('You added pizza '+id);
  }