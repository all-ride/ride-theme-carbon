{* Renders a grid layout *}
{function renderLayout blocks=['1' => ''] containerClass='grid'}
<div class="{$containerClass}" id="section-{$region}-{$section}">
    {foreach $blocks as $block => $className}
    <div class="{$className}" id="block-{$section}-{$block}">
        {if isset($widgets[$block])}
            {foreach $widgets[$block] as $widget}
                {$widget}
            {/foreach}
        {/if}
    </div>
    {/foreach}
</div>
{/function}