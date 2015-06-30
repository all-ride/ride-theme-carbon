{* widget: text; action: index; translation: template.text.simple *}

{include 'cms/helper/text'}

<div class="text block {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    {call renderTextSimple}
</div>
