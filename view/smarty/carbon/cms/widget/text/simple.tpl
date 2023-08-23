{* widget: text; action: index; translation: template.text.simple *}

{include 'cms/helper/text'}

<div class="text block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
    {call renderTextSimple}
</div>
