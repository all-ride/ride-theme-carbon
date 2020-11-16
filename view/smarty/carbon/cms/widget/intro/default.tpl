{* widget: intro; action: index; translation: widget.intro *}

{if $html}
    <div class="block" {if isset($app['cms']['widge'])}id="widget-{$app['cms']['widget']}"{/if}>
        <div class="grid">
            <div class="grid__12 grid--bp-med__10">
                <div class="text text--lead {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
                    {$html|text}
                </div>
            </div>
        </div>
    </div>
{/if}
