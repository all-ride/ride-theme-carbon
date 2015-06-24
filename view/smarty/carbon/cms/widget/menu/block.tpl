{* widget: menu; action: index; translation: widget.menu.block *}

{*
    Renders the items of a menu
*}
{function name="renderBlockMenu" items=null prefix=null number=null depth=null class=null}
    {assign var="prefix" value="`$prefix``$number`"}

    <div class="{$prefix} {$class} grid grid--bp-sml-2-col">
    {foreach $items as $node}
        {if !$node->hideInMenu() && $node->isPublished() && $nodeTypes[$node->getType()]->getFrontendCallback() && $node->isAvailableInLocale($app.locale) && $node->isAllowed($app.user)}
        {$meta = $node->getMeta($app.locale)}
        <div class="grid__item {if $node@first}first {/if}{cycle values="even,odd" name=$prefix}{if $app.cms.node->hasParent($node->getId())} active-trail{elseif $app.cms.node->getId() == $node->getId()} active{/if}{if $node@last} last{/if}">
            <a href="{$app.url.script}{$node->getRoute($app.locale)}" class="excerpt excerpt--link excerpt--nav nav__link nav__link--{$node->getId()|replace:'.':'-'}">
                {if $node->getImage($app.locale)}
                    <div class="excerpt__aside">
                        <div class="excerpt__img">
                            <img src="{image src=$node->getImage($app.locale) width=140 height=105 transformation="crop"}" alt="" class="image image--full-width">
                        </div>
                    </div>
                {/if}
                <div class="excerpt__main">
                    <div class="excerpt__header">
                        <h3 class="nav__title heading--alt">{$node->getName($app.locale, "menu")|text}</h3>
                    </div>
                    {if $node->getDescription($app.locale)}
                        <p class="nav__description">{$node->getDescription($app.locale)}</p>
                    {/if}
                    <span class="excerpt__link link--ext">{$node->getName($app.locale, "menu")|text}</span>
                </div>
            </a>
            {if $node->getChildren() && $depth > 1}
                {call renderBlockMenu items=$node->getChildren() prefix="`$prefix`sub" number=$number depth=$depth-1}
                {assign var="number" value=$number+1}
            {/if}
        </div>
        {/if}
    {/foreach}
    </div>
{/function}

<nav class="block nav nav--block {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}" role="navigation">
    {if $title}
        <h2 class="{$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h2>
    {/if}

    {call renderBlockMenu prefix="menu" items=$items number=1 depth=$depth class=$app.cms.properties->getWidgetProperty('style.menu')}
</nav>