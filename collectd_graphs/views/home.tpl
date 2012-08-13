<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Collectd statistics</title>
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.1/jquery.mobile-1.1.1.min.css" />
    <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.1.1/jquery.mobile-1.1.1.min.js"></script>
    
</head>
<body>
    
    <div data-role="page" id="home"> 
        <div data-role="header">
            <h1>Collectd statictics</h1>
        </div>
        
        <div data-role="content">
        <h2>Machines</h2>
            %for x in data:
            <p><a href="#{{ x }}" data-role="button">{{ x }}</a></p>
            %end
        </div> 
        <div data-role="footer">Developed for BEST-HOSTING - <a href="http://best-hosting.cz">http://best-hosting.cz</a></div> 
    </div> 

    %for machine in data:
    <div data-role="page" id="{{ machine }}">
        <div data-role="header">
            <a href="#home" data-role="button">Home</a>
            <h1>Plugins on {{ machine }}</h1>
        </div>
        <div data-role="content">
        <h2>Plugins on {{ machine }}</h2>
            %for plugin in data[machine]:
                %if data[machine][plugin]["day"]:
                <strong>{{ plugin }}</strong><br>
                <div data-role="controlgroup" data-type="horizontal">
                %for time in ("day", "week", "month", "three-months", "six-months", "year"):
                    <a href="#{{ machine }}-{{ plugin }}-{{ time }}" data-role="button">{{ time }}</a>
                %end
                </div>
                %end
            %end
        </div> 
    </div> 
    %end

    %for machine in data:
    %for plugin in data[machine]:
    %for time in data[machine][plugin]:
    <div data-role="page" id="{{ machine }}-{{ plugin }}-{{ time }}"> 
        <div data-role="header">
            <a href="#{{ machine }}" data-role="button">Plugins list</a>
            <h1>{{ plugin }} on {{ machine }}</h1>
        </div>
        <div data-role="content">
        %for graph in data[machine][plugin][time]:
            <p><strong>{{ graph }}</strong></p>
            <p><img src="/static/{{ machine }}/{{ plugin }}/{{ graph }}" alt="{{ graph }}"></p>
        %end
        </div> 
    </div> 
    %end
    %end
    
</body>
</html>