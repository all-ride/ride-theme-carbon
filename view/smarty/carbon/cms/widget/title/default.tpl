{* widget: title; action: index; translation: widget.title *}

<div class="block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
{if !isset($heading)}
    {$heading = 1}
{/if}

{if (!isset($title) || $title === null) && isset($app['cms']['context']['title']['node'])}
    {$title = $app['cms']['context']['title']['node']}
{/if}

{if isset($anchor) && $anchor}
    <a name="{$anchor}"></a>
{/if}

    <h{$heading} class="{if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.title')}{/if}">{$title|text}</h{$heading}>
</div>
