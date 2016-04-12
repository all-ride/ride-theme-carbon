<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:v="urn:schemas-microsoft-com:vml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
body {
    font-family: Arial, Helvetica, sans-serif;
    margin: 0;
    padding: 0; 
    background: #f3f3f3;
}

/* Hotmail centreren */
.ReadMsgBody { width: 100%;}
.ExternalClass {width: 100%;}

/* Achtergrond Outlook2007 */
v:* { 
    behavior: url(#default#VML); 
    display: inline-block;
}

/* Link kleur Yahoo */
.yshortcuts { color: #CCCCCC } /* Body text color */
.yshortcuts a span { color: #00FF00 } /* Link text color */

img {
    display: block; 
}

a img {
    border: 0;
}

a {
    color: #1c3b6c;
}

table td {
    text-align: left;
}

table td p {
    margin: 0 0 10px 0;
    padding: 0;
}

@media (max-width: 600px) {

* { -webkit-text-size-adjust:none; }

table[id=wrapper] { width:100%!important; padding:0px 10px !important; }

table[id=wrapper] #main, table[id=wrapper] .inner { width:100% !important; }

table[id=wrapper] .hidden, table[id=wrapper] .spacer { width:0 !important; display:none !important; }

table[id=wrapper] .width-null { width: 0px !important; }

table[id=wrapper] .top-story { width:100% !important; clear: left !important; padding: 0 0 5px 30px !important; }
table[id=wrapper] .top-story-links {  width:100% !important; clear: left !important; padding: 0 30px 25px 0 !important; }
table[id=wrapper] .top-story-rechts {  width:100% !important; clear: left !important; padding: 0 0px 5px 30px !important; }

table[id=wrapper] .fullimage img { width: 100% !important; height: auto !important; }

table[id=wrapper] .left { text-align: left !important; }
table[id=wrapper] .center { text-align: center !important; padding-bottom: 15px !important; }

}

</style>
</head>

<body>

<table id="wrapper" width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#f3f3f3">
    <tr>
        <td>
        <center>
        
        <table id="main" width="600" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td height="30"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#c0eb00">
                        <tr>
                            <td width="30"></td>
                            <td>
                                <table class="top-story" width="30%" cellspacing="0" cellpadding="0" border="0" align="left">
                                    <tr>    
                                        <td height="20"></td>
                                    </tr>
                                    <tr>
                                        <td class="center"><a href="{$app.url.base}"><img src="{$app.url.base}/img/svg/fallback/logo.png" alt="Logo" style="display: inline;"/></a></td>
                                    </tr>
                                    <tr>
                                        <td class="hidden width-null" height="20"></td>
                                    </tr>
                                </table>
                            </td>
                            <td width="30"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                {block 'body'}
                    <table width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#ffffff">
                        <tr>
                            <td colspan="3" height="30"></td>
                        </tr>
                        <tr>
                            <td width="30"></td>
                            <td style="font-family: Arial, sans-serif; color: #484848; font-size: 14px; line-height: 22px;">
                                {block 'body_content'}{/block}
                            </td>
                            <td width="30"></td>
                        </tr>
                        <tr>
                            <td colspan="3" height="30"></td>
                        </tr>
                   </table>
                   {block 'body_data'}
                   {if isset($data) && $data}
                   {foreach $data as $label => $value}
                   <table width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#ffffff">
                        <tr>
                            <td class="hidden" width="30"></td>
                            <td>
                                <table class="top-story" width="46%" cellspacing="0" cellpadding="0" border="0" align="left">
                                    <tr>
                                        <td width="35%" style="font-family: Arial, sans-serif; color: #000000; font-size: 14px; line-height: 22px;">
                                            <strong>{"label.$label"|translate}</strong>
                                        </td>
                                    </tr>
                                </table>
                                <table class="top-story" width="46%" cellspacing="0" cellpadding="0" border="0" align="right">
                                    <tr>
                                        <td width="45%" style="font-family: Arial, sans-serif; color: #484848; font-size: 14px; line-height: 22px;">
                                            {$value}
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="hidden" width="30"></td>
                        </tr>
                        <tr>
                            <td colspan="4" height="10"></td>
                        </tr>
                   </table>
                   {/foreach}
                   {/if}
                   {/block}
                {/block}
                </td>
            </tr>
            <tr>
                <td colspan="2" height="20" bgcolor="#ffffff"></td>
            </tr>  
            <tr>
                <td colspan="2" height="10"></td>
            </tr>      
            <tr>
                <td width="46%" style="color: #828282; font-size: 12px; text-align: center;">
                   &copy; <a href="{$app.url.base}">{if isset($app.taskbar)}{$app.taskbar->getTitle()}{/if}</a>
                </td>
            </tr> 
            <tr>
                <td colspan="2" height="40"></td>
            </tr> 
        </table>
        
        </center>
        </td>
     </tr>
</table>         

</body>
</html>