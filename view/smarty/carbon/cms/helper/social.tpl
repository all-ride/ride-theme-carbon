{function renderSocialMediaNav title=null socialMedia=null}
    {$nodeTitle = $app.cms.context.title.node|text}
    {$url = $app.url.request}
    {if empty($socialMedia)}
        {$socialMedia = $app.system->getConfig()->get('socialshare.default')}
    {/if}

    {if $socialMedia}
        <div class="block nav nav--social nav--social-share {$app.cms.properties->getWidgetProperty('style.container')}">
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
{/function}

{function renderSocialMedia url=null title=null media=null}
    {if $media}
        {$label = $media|capitalize}
        {$media = $media|lower}
        {$url = $url|urlencode}

        {$links = [
            'facebook' => "http://www.facebook.com/sharer.php?u={$url}",
            'google' => "https://plus.google.com/share?url={$url}",
            'pinterest' => "https://pinterest.com/pin/create/bookmarklet/?&url={$url}&description={$title}",
            'linkedin' => "http://www.linkedin.com/shareArticle?url={$url}&title={$title}",
            'digg' => "http://digg.com/submit?url={$url}&title={$title}",
            'reddit' => "http://reddit.com/submit?url={$url}&title={$title}",
            'stumbleupon' => "http://reddit.com/submit?url={$url}&title={$title}",
            'tumblr' => "http://www.tumblr.com/share/link?url={$url}&name={$title}",
            'twitter' => "https://twitter.com/share?url={$url}",
            'email' => "mailto:?Body={$url}"
        ]}

        {if isset($links.$media)}
            <a href="{$links.$media}" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=450,width=600'); return false;" target="_blank" class="nav__link nav__link--{$media}" title="Share on {$label}">
                {if $media == 'email'}
                    <i class="icon icon--envelope"></i>
                {else}
                    <i class="icon icon--{$media}"></i>
                {/if}
                <span class="visuallyhidden">{$label}</span>
            </a>
        {/if}
    {/if}
{/function}
