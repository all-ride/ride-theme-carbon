{* Renders a grid layout *}
{function renderLayout blocks=['1' => ''] containerClass='grid'}
    {if $containerClass}
        <div class="{$containerClass}" id="section-{$region}-{$section}">
    {/if}
    {foreach $blocks as $block => $className}
        {if $className}
            <div class="{$className}" id="block-{$section}-{$block}">
        {/if}
        {if isset($widgets[$block])}
            {foreach $widgets[$block] as $widget}
                {$widget}
            {/foreach}
        {/if}
        {if $className}
            </div>
        {/if}
    {/foreach}
    {if $containerClass}
        </div>
    {/if}
{/function}