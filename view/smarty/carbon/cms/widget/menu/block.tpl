{* widget: menu; action: index; translation: template.menu.block *}

{*
    Renders the items of a menu
*}
{function renderBlockMenu items=null prefix=null number=null depth=null class=null}
    {$prefix = "$prefix$number"}
    {$user = isset($app['security']) ? $app['security']->getUser() : null}

    <div class="{$prefix} {$class} grid grid--bp-sml-2-col">
    {foreach $items as $node}
        {$isHidden = $node->hideInMenu() || ($user && $node->hideForAuthenticatedUsers()) || (!$user && $node->hideForAnonymousUsers())}
        {if !$isHidden && $node->isPublished() && $nodeTypes[$node->getType()]->getFrontendCallback() && $node->isAvailableInLocale($app['locale']) && $node->isAllowed($app['security'])}
        {$meta = $node->getMeta($app['locale'])}
        <div class="grid__item">
            <a href="{$app['url']['script']}{$node->getRoute($app['locale'])}" class="card card--link card--nav">
                {if $node->getImage($app['locale'])}
                    <div class="card__aside">
                        <div class="card__img">
                            <img src="{image src=$node->getImage($app['locale']) width=180 height=180 transformation='crop'}" alt="">
                        </div>
                    </div>
                {/if}
                <div class="card__main">
                    <div class="card__header">
                        <h3 class="card__title">{$node->getName($app['locale'], 'menu')|text}</h3>
                    </div>
                    <div class="card__content">
                    {if $node->getDescription($app['locale'])}
                        <p class="card__text">{$node->getDescription($app['locale'])}</p>
                    {/if}
                        <span class="card__link">{'label.more.link'|translate}</span>
                    </div>
                </div>
            </a>
            {if $node->getChildren() && $depth > 1}
                {call renderBlockMenu items=$node->getChildren() prefix="`$prefix`sub" number=$number depth=$depth-1}
                {$number = $number + 1}
            {/if}
        </div>
        {/if}
    {/foreach}
    </div>
{/function}

<div class="block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
    {if $title}
        <h2 class="{if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.title')}{/if}">{$title}</h2>
    {/if}

    {if $items === false}
        {$items = isset($app['cms']['context']['title']['nodes']) ? $app['cms']['context']['title']['nodes'] : false}
    {/if}
    {$class = isset($app['cms']['properties']) ? $app['cms']['properties']->getWidgetProperty('style.menu'): null}
    {call renderBlockMenu prefix='menu' items=$items number=1 depth=$depth class=$class}
</div>
