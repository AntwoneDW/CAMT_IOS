function ie_getElementsByTagName(str)
{
  if(str == "*")
  {
    return document.all
  }
  else
  {
    return document.all.tags(str)
  }
}

function refresh()
{
  if(parent)
  {
    if (parent.nav)
    {
      if(zoomlevel != parent.nav.curzoom)
      {
        oldzoom = zoomlevel;
        zoomlevel = parent.nav.curzoom;
        if (document.all)
        {
          document.getElementsByTagName=ie_getElementsByTagName;
        }
        if(document.body.id)
        {
          var d = document.body.id;
          var s1 = d;
          var fontSize = parseInt(s1);
          document.body.style.fontSize = parseInt(fontSize * zoomlevel / 100) + 'px';
        }
        var obj = document.getElementsByTagName("img");
        for (var i = 0; i < obj.length; i++)
        {
          var el = obj[i];
          var d = el.name;
          if(d)
          {
            var p = d.search(":");
            var s1 = d.substring(1, p);
            var s2 = d.substring(p + 1, d.length);
            el.width = (parseInt(s2) * zoomlevel / 100);
            el.height = (parseInt(s1)*zoomlevel/100);
          }
        }
        var obj = document.getElementsByTagName("span")
        for (var i=0;i < obj.length;i++)
        {
          var el = obj[i];
          el.style.verticalAlign = "bottom";
          if(el.style.fontSize)
          {
            var d = el.id;
            if(d)
            {
              var s1 = d.substring(1,d.length);
              var fontSize = parseInt(s1);
              el.style.fontSize = parseInt(fontSize * zoomlevel / 100) + 'px';
            }
          }
        }
        var obj = document.getElementsByTagName("div")
        for (var i=0; i < obj.length; i++)
        {
          var el = obj[i];
          var d = el.id;
          if(d)
          {
            var p = d.search(":");
            var s1 = d.substring(1, p);
            var s2 = d.substring(p + 1, d.length);
            if(document.all)
            {
              el.style.pixelLeft = parseInt(s1) * zoomlevel / 100;
              el.style.pixelTop = parseInt(s2) * zoomlevel / 100;
            }
            else
            {
              el.style.left = (parseInt(s1) * zoomlevel / 100) + "px";
              el.style.top = (parseInt(s2) * zoomlevel / 100) + "px";
            }
          }
        }
      }
    }
  }
}
function setpagenum(num)
{
  if (parent.menu)
  {
    parent.settitle(pagetitle);
    if (parent.nav)
    {
      parent.nav.setcurpage(num);
    }
  }
  refresh();
}
