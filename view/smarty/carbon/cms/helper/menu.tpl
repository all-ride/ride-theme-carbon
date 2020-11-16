{*
    Renders the items of a menu
*}
{function renderMenu items=null prefix=null number=null depth=null class=null}
    {$prefix = "$prefix$number"}
    {$user = isset($app['security']) ? $app.security->getUser() : null}

    <ul class="nav__menu {$prefix} {$class}">
    {foreach $items as $node}
        {$isHidden = $node->hideInMenu() || ($user && $node->hideForAuthenticatedUsers()) || (!$user && $node->hideForAnonymousUsers())}
        {if !$isHidden && $node->isPublished() && $nodeTypes[$node->getType()]->getFrontendCallback() && $node->isAvailableInLocale($app['locale']) && $node->isAllowed($app['security'])}
            {$active = false}

            {if $app['cms']['node']->getId() == $node->getId() && !$app['cms']['node']->hasParent($node->getId())}
                {$active = true}
            {/if}

            {if $node->getType() == 'redirect'}
                {if $node->getRedirectNode($app['locale']) == $app['cms']['node']->getId() || $app['cms']['node']->getId() == $node->getId()}
                    {$active = true}
                {/if}
            {/if}

            {$isActive = $app['cms']['node']->hasParent($node->getId()) || $active}

            <li class="nav__item{if $isActive} active{/if}">
                <a href="{$app['url']['script']}{$node->getRoute($app['locale'])}" class="nav__link nav__link--{$node->getId()|replace:'.':'-'}{if $isActive} active{/if}">{$node->getName($app['locale'], "menu")}</a>
                {if $node->getChildren() && $depth > 1}
                    {call renderMenu items=$node->getChildren() prefix="`$prefix`sub" number=$number depth=$depth-1}

                    {$number = $number + 1}
                {/if}
            </li>
        {/if}
    {/foreach}
    </ul>
{/function}

{if !isset($element)}
    {$element = 'div'}
{/if}

<{$element} class="nav {if isset($menuClass)}{$menuClass}{/if} {if $parent}nav--{$parent->getId()|replace:'.':'-'}{/if} {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')} {/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}{/if}">
    {if $title}
        <h2 class="{if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.title')}{/if}{if isset($titleClass)} {$titleClass}{/if}">{$title}</h2>
    {/if}

    {if $items === false}
        {$items = $app['cms']['context']['title']['nodes'] ? $app['cms']['context']['title']['nodes'] : false}
    {/if}

    {call renderMenu prefix='menu' items=$items number=1 depth=$depth class=$app.cms.properties->getWidgetProperty('style.menu')}
</{$element}>
