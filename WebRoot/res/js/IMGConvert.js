var IMGConvert = function (imgId, textId) 
{
    var wc = this;
    this.constructor = arguments.callee;

    this.step = 5;
    this.time = 10000;
    this.cstep = 20;
    this.imgElement = document.getElementById(imgId);
    this.textElement = document.getElementById(textId);
    //this.infoElement = document.getElementById(infoId);
    this.timer = this.ctimer = this.i = 0;
    
    this.each(this.anchorLists = [], this.imgElement.getElementsByTagName('a'), function (a, b) { a.push(b); b.style.display = 'none'; });
	
    this.each(this.textLists = [], this.textElement.getElementsByTagName('li'), function (a, b, i) {
        a.push(b);
        b.onmouseover = function () 
		    {
            with (wc.reItem(wc.i, wc.textLists).style) 
		      	{
                backgroundColor = '#333', color = '#FFF';
            }
            wc.convert(i - 1);
        };
    });
    
    if (this.anchorLists.length < 2) return;
    
    this.init();
};

IMGConvert.prototype = {

    each : function (a, b, f) 
	  {
        for (var i = 0, l = b.length ; i < l ; i ++) f(a, b[i], i);
    }
    
    , init : function () 
	  {
        var wc = this;
        this.anchorLists[0].style.display = 'block';
        this.setText();
        this.timer = window.setTimeout(function ()
	      {
            wc.convert();
        }, this.time);
    }
    
    , reItem : function (i, a) 
	  {
        //获得元素
        return i >= a.length ? a[0] : i < 0 ? a[a.length - 1] : a[i];
    }
    
    , setText : function () 
	  {
        //设置字
        with (this.reItem(this.i - 1, this.textLists).style) 
		    {
            backgroundColor = '#333', color = '#FFF';
        }
        with (this.textLists[this.i].style) 
		    {
            backgroundColor = '#FFF', color = '#333';
        }
        //this.infoElement.innerHTML = this.anchorLists[this.i].getElementsByTagName('img')[0].getAttribute('alt').replace(/</ig, '<').replace(/>/ig, '>');
    }
    
    , convert : function (n) 
	  {
        //切换
        var wc = this, i = 100, n = 'undefined' == typeof n ? this.i : n;
        
        var a = this.reItem(n, this.anchorLists), b = this.reItem(n + 1, this.anchorLists);

        this.clear(1);
        
        this.i = n + 1 < this.anchorLists.length ? n + 1 : 0;
        this.time = this.i == 0 ? 10000 : 3500;
        
        this.setText();
        
        a.style.zIndex = 2, b.style.zIndex = 1;
        a.style.display = b.style.display = 'block';
        a.style.filter = b.style.filter = 'alpha(opacity=100)';
        a.style.opacity = b.style.opacity = 1.0;
        
        this.timer = window.setInterval(function ()
	      {
            if (i < 0) 
            {
                wc.clear();
                wc.ctimer = window.setTimeout(function () 
                {
                    wc.convert();
                }, wc.time);
            }
            
            a.style.filter = 'alpha(opacity=' + i + ')';
            a.style.opacity = i / 100;
            i -= wc.step;
            
        }, this.cstep);
    }
    
    , clear : function (b) 
	  {
        //清理
        this.timer && (window.clearInterval(this.timer), (this.timer = 0));
        this.ctimer && (window.clearTimeout(this.ctimer), (this.ctimer = 0));
        this.reItem(this.i - 1, this.anchorLists).style.display = 'none';
        b && (this.reItem(this.i, this.anchorLists).style.display = 'none');
    }
    
};