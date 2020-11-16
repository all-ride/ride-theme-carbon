{* widget: social-media; action: index; translation: template.social.links *}

{if $socialMedia}
    <div class="nav nav--social nav--social-links {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}">

    {if $title}
        <h2 class="{if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.title')}{/if}">{$title}</h2>
    {/if}

        <ul>
        {foreach $socialMedia as $media}
            <li class="nav__item">
                <a href="{$media['url']}" class="nav__link" target="_blank">
                    <i class="icon icon--{$media['name']|lower}"></i>
                    <span class="visuallyhidden">{$media['name']|capitalize}</span>
                </a>
            </li>
        {/foreach}
        </ul>

    </div>
{/if}
