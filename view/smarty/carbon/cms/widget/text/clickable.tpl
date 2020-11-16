{* widget: text; action: index; translation: template.text.clickable *}

{include 'cms/helper/text'}

{$tmpCTAs = $callToActions}
{$firstCallToAction = $tmpCTAs|@array_shift}

{if $callToActions}
    <a href="{$firstCallToAction->getUrl()}" class="text block text--clickable {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
        {call renderTextSimple callToActionsType='span'}
    </a>
{else}
    <div class="text block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
        {call renderTextSimple}
    </div>
{/if}
