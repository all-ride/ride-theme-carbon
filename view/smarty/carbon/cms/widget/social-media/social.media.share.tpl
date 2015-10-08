{* widget: social-media; action: index; translation: template.social.share *}

{$nodeTitle = $app.cms.context.title.node|text}
{$url = $app.url.request}

{include file="cms/helper/social"}

{if $socialMedia}
    <div class="nav nav--social nav--social-share {$app.cms.properties->getWidgetProperty('style.container')}">

        {if $title}
            <h2 class="{$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h2>
        {/if}

        <ul>
            {foreach $socialMedia as $media}
                <li>
                    {call renderSocialMedia url=$url title=$nodeTitle media=$media}
                </li>
            {/foreach}
        </ul>
    </div>
{/if}
