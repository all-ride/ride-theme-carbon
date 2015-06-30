{* widget: text; action: index; translation: template.text.default *}

{include 'cms/helper/text'}

<div class="text block {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    {call renderText}
</div>
