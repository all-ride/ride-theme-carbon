{* widget: text; action: index; translation: template.text.lead *}

{include 'cms/helper/text'}

<div class="grid block block--intro">
    <div class="grid__item grid--bp-med__10">
        <div class="text text--lead block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
            {call renderTextSimple titleClass='heading--border'}
        </div>
    </div>
</div>
