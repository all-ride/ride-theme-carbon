{* widget: text; action: index; translation: template.text.panel *}

{include 'cms/helper/text'}

<div class="text block block--panel {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    {call renderText}
</div>
