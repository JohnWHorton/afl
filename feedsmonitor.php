
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<meta name="format-detection" content="telephone=no">
<meta charset="UTF-8">


<head>


    <!-- CSS -->
    <link href="tc_css/bootstrap.min.css" rel="stylesheet"> 
    <link href="tc_css/animate.min.css" rel="stylesheet">
    <link href="tc_css/font-awesome.min.css" rel="stylesheet">
    <link href="tc_css/form.css" rel="stylesheet">

    <link href="tc_css/style.css" rel="stylesheet">
    <link href="tc_css/icons.css" rel="stylesheet">
    <link href="tc_css/generics.css" rel="stylesheet">


    <!-- Javascript Libraries -->
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script> <!-- jQuery Library -->
    <script src="js/jquery-ui.min.js"></script> <!-- jQuery UI -->
    <script src="js/jquery.easing.1.3.js"></script> <!-- jQuery Easing - Requirred for Lightbox + Pie Charts-->

    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>

    <!-- CSS -->
<!-- <link rel="stylesheet" type="text/css" href="tc_css/style.css"> -->

    <!-- JS -->
    <link rel="stylesheet" type="text/css" href="AnalysisJSCSS/jquery.dynatable.css">
    <script type="text/javascript" src="AnalysisJSCSS/jquery.dynatable.js"></script>
    <script src="/js/ajax.js"></script>
    

    <script type='text/javascript'>
        // getting JSON from the document works, but of what use is that?
        $(document).ready( function() {
            ajax.get('https://apisrv.rogueeye.systems/gc/filter/SizdenBaşkaHerkesTerörist').done(res => {
                let tableData = [];
                let id = 1;
                
                $.each(res['hits'], (i, hit) => {
                    let data = [],
                        type = array_get(hit, 'type', ''),
                        created = array_get(hit, 'created_at', ''),
                        targetID = array_get(hit, 'targetID'),
                        logo = array_get(hit, 'logo', ''),
                        tags = array_get(hit, 'tags', ''),
                        comments = array_get(hit, 'comment_count', 0),
                        likes = array_get(hit, 'like_count', 0),
                        sentiment = ucfirst(array_get(hit, 'sentiment', 'Natural')),
                        picture = array_get(hit, 'PicURL', ''),
                        link = array_get(hit, 'marker_url', ''),
                        title = array_get(hit, 'title', ''),
                        description = array_get(hit, 'description', ''),
                        cases = array_get(hit, 'case', ''),
                        username = array_get(hit, 'user_name', array_get(hit, 'user_id', '')),
                        content = '',
                        taskID = 0;
                    if(!empty(tags)) {
                        let tagsArr = tags.split(',');
                        tags = '';
                        $.each(tagsArr, (k, v) => {
                            tags += `<button class='button'>${v.trim()}</button>`;
                        });
                    }
                    let sentimentPic = `<span><img height='20px' width='20px' title='${sentiment}' src='img/icon/${sentiment}.png'> <b>${sentiment}</b></span>`;
                    created = created.replace(' ', '<br>');
                    cases += ` (#${array_get(hit, 'case_id', 1)})`
                    link = `<a target='blank' href='${link}'><div class='linkToPost'>Click Here<br>For Content</div></a>`;
                    if(!empty(title)) {
                        content += `<b>Title: </b>${title}<br>`;
                    }
                    if(!empty(description)) {
                        content += `<b>Content: </b>${description}`;
                    }
                    if(username === null || username === 'null') {
                        username = '';
                    }
                    let usernameV = username.replace(/\r|\n|\t/, '');
                    usernameV = usernameV.trim();
                    
                    let createTargetAction = `<a target="_top" href="https://targetcenter.rogueeye.systems/targetcenter-addprofile.php?massInd=1&TFirstName=${usernameV}&massTaskID=${taskID}&massUser=${username}&massType=&massPics=" title="Create Target" style="color: white; padding: 10px;">&nbsp;+&nbsp;</a>`;
                    let actions = `<i class="icon pull-left btn" >${createTargetAction}<a title="View On Map" style="padding: 10px;"><img style="height:15px; width: 15px; " src="img/icon/AnalyzeW.png"></a></i>`;
                    let engagement = `<span style="float: left;"><img height="20px" width="20px" title="likes" src="/img/icon/LikeW.png"> <b>${likes}</b></span>`;
                    engagement += `<span style="float: right"><img height="20px" width="20px" title="likes" src="/img/icon/CommentW.png"> <b>${comments}</b></span>`;
                    
                    logo = `https://targetcenter.rogueeye.systems${logo}`;
                    let app = array_get(hit, 'app', '').toLowerCase();
                    let error;
                    switch (app) {
                        case 'facebook':
                            error = 'https://rogueeye.systems/images/FB_profile1.jpg';
                            break;
                        case 'twitter':
                            error = 'https://rogueeye.systems/images/twitterProfile.png';
                            break;
                        case 'instagram':
                            error = 'https://rogueeye.systems/images/instagramProfile.png';
                            break;
                        case 'telegram':
                            error = 'https://targetcenter.rogueeye.systems/img/telegramGroup.png';
                            logo = 'https://targetcenter.rogueeye.systems/img/telegramLogo.png';
                            break;
                        default:
                            error = 'https://rogueeye.systems/images/FB_profile1.jpg';
                    }
                    
                    tableData.push({
                        id: id++,
                        created: created,
                        "case": cases,
                        engagement: engagement,
                        sentiment: sentimentPic,
                        link: link,
                        actions: actions,
                        tags: empty(tags) ? '' : tags,
                        content: `<div class='content'>${content}</div>`,
                        source: `<div><img src='${logo}' data-app='${app}' data-type='${type}' height='40px' width='40px'></div>`,
                        picture: `<img src='https://rogueeye.systems:8880/${picture}' onerror='this.src="${error}"' class='picture'>`,
                        name: `${username} <a target='_top' href='https://targetcenter.rogueeye.systems/Profile?TargetID=${targetID}'>(${targetID})</a>`
                    });
                })
                $('#local').dynatable({
                    dataset: {
                        perPageDefault: 10,
                        sorts: { 'ID': -1 },
                        perPageOptions: [6,12,24,48],
                        records: tableData
                    },
                    features: {
                        paginate: true,
                        sort: true,
                        pushState: false,
                        search: true,
                        recordCount: true,
                        perPageSelect:false
                    }

                });
                $('#collectedTraffic', parent.document).text(res['total']);
            })
            

        });

    </script>

    <style type="text/css">
        body
        {
            background:none transparent;
        }
        #Left { max-width: 500px; }
        #Right { max-width: 500px; }
        input, select, textarea{
            color: #FFFFFF;
            outline: none;

        }

        textarea:focus, input:focus {
            color: #FFFFFF;
            outline: none;

        }

        input {
            background: rgba(0, 0, 0, 0.05);
            outline: none;
            border:none;
        }

        .table > tbody > tr > td {
            vertical-align: middle;
            text-align: left;
        }
        
        .linkToPost {
            white-space: nowrap;
        }
        
        .picture {
            height: 75px;
            max-width: 75px;
        }
        
        button.button {
            background-color: #cccccc;
            border: #666;
            color: black;
            font-weight: bolder;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
        }
        .dynatable-head {
            text-align: center;
        }
        
        .content {
            overflow-wrap: break-word;
            word-break: break-word;
        }
    </style>


</head>

<body>

<div class="col-md-12">
    <br><br>
    <div class="col-md-12" >
    <table class="table table-condensed table_bordered tile"  id="local"  cellspacing="0" cellpadding="0">
        <col width="3%" name="id">
        <col width="7%" name="time">
        <col width="7%" name="case">
        <col width="5%" name="source">
        <col width="3%" name="picture">
        <col width="7%" name="name">
        <col width="26%" name="content">
        <col width="13%" name="tags">
        <col width="7%" name="engagements">
        <col width="7%" name="sentiment">
        <col width="7%" name="link">
        <col width="7%" name="action">
        <caption style="text-align: left;"><h4>
      <thead>
        <th data-dynatable-column="id" style="border-color:gray;">ID</th>
        <th data-dynatable-column="created" >Time</th>
        <th data-dynatable-column="case">Case</th>
        <th data-dynatable-column="source" >Source</th>
        <th data-dynatable-column="picture" >Picture</th>
        <th data-dynatable-column="name" >Name/ID</th>
        <th data-dynatable-column="content">Content</th>
        <th data-dynatable-column="tags">Tags And Entities</th>
        <th data-dynatable-column="engagement">Engagements</th>
        <th data-dynatable-column="sentiment">Sentiment</th>
        <th data-dynatable-column="link">Link</th>
        <th data-dynatable-column="actions">Actions</th>
        
      </thead>
      <tbody>
      </tbody>
    </table>
    </div>



</div> <!-- opening div -->



<script>
    $(document).ready(function(){
        $('#collectedTraffic', parent.document).text('');
    });

    function empty(mixedVar) {
        let emptyValues = [undefined, null, false, ''];
        for(let i = 0, len = emptyValues.length; i < len; i++) {
            if(mixedVar === emptyValues[i]) {
                return true;
            }
        }

        if(mixedVar.length < 1) {
            return true;
        }

        if (typeof mixedVar === 'object') {
            for (let key in mixedVar) {
                if (mixedVar.hasOwnProperty(key)) {
                    return false
                }
            }
            return true
        }
        return false;
    }

    function trim(str, charlist) {
        let whitespace = [
            ' ',
            '\n',
            '\r',
            '\t',
            '\f',
            '\x0b',
            '\xa0',
            '\u2000',
            '\u2001',
            '\u2002',
            '\u2003',
            '\u2004',
            '\u2005',
            '\u2006',
            '\u2007',
            '\u2008',
            '\u2009',
            '\u200a',
            '\u200b',
            '\u2028',
            '\u2029',
            '\u3000'
        ].join('')

        let l = 0
        let i = 0
        str += ''

        if (charlist) {
            whitespace = (charlist + '').replace(/([[\]().?/*{}+$^:])/g, '$1')
        }

        l = str.length
        for (i = 0; i < l; i++) {
            if (whitespace.indexOf(str.charAt(i)) === -1) {
                str = str.substring(i)
                break
            }
        }

        l = str.length
        for (i = l - 1; i >= 0; i--) {
            if (whitespace.indexOf(str.charAt(i)) === -1) {
                str = str.substring(0, i + 1)
                break
            }
        }

        return whitespace.indexOf(str.charAt(0)) === -1 ? str : ''
    }

    function array_get(arr,key,def) {
        if (typeof def === 'undefined') { def = null; }
        if (!key) return arr;

        var s = key.split('.');

        var o = arr;

        for(var x=0;x < s.length; x++)
        {
            if (null !== o && o.hasOwnProperty(s[x]))
            {
                o = o[s[x]];
            }
            else
            {
                return def;
            }
        }

        return o;
    }

    function ucfirst(str) {
        str += '';
        return str.charAt(0).toUpperCase() + str.substr(1).toLowerCase();
    }
</script>

</body>
</html>
