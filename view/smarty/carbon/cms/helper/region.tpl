{function region region=null class=null role=null element='div'}
    {if isset($widgets.$region)}
    {* <{$element} class="region {$class}"{if $role} role="{$role}"{/if}> *}
        {foreach $regions.$region as $section => $layout}
            {if isset($widgets.$region.$section)}
                {$functionName = "layout-$layout"|replace:'-':'_'}
                {$style = $app.cms.node->getSectionStyle($region, $section)}
                {$title = $app.cms.node->getSectionTitle($region, $section, $app.locale)}
                {$isFullWidth = $app.cms.node->isSectionFullWidth($region, $section)}
                <div class="section section--{$region} {if $style}{$style}{else}section--default{/if}">
                    {if $isFullWidth}
                        {if $title}
                            <div class="section__title">{$title}</div>
                        {/if}
                        {call $functionName section=$section widgets=$widgets.$region.$section style=$style}
                    {else}
                        <div class="container">
                            <div class="section__content">
                                {if $title}
                                    <div class="section__title">{$title}</div>
                                {/if}
                                {call $functionName section=$section widgets=$widgets.$region.$section style=$style}
                            </div>
                        </div>
                    {/if}
                </div>
            {/if}
        {/foreach}
    {* </{$element}> *}
    {/if}
{/function}

{function regionSimple region=null class=null role=null element='div'}
    {if isset($widgets.$region)}
    {* <{$element} class="region {$class}"{if $role} role="{$role}"{/if}> *}
        {foreach $regions.$region as $section => $layout}
            {if isset($widgets.$region.$section)}
                {$functionName = "layout-$layout"|replace:'-':'_'}
                {$style = $app.cms.node->getSectionStyle($region, $section)}
                {$isFullWidth = $app.cms.node->isSectionFullWidth($region, $section)}
                {if $style}<div class="{$style}">{/if}
                    {if $isFullWidth}
                        <div class="{$class}__content">
                            {call $functionName section=$section widgets=$widgets.$region.$section style=$style}
                        </div>
                    {else}
                        <div class="container">
                            <div class="{$class}__content">
                                {call $functionName section=$section widgets=$widgets.$region.$section style=$style}
                            </div>
                        </div>
                    {/if}
                {if $style}</div>{/if}
            {/if}
        {/foreach}
    {* </{$element}> *}
    {/if}
{/function}
