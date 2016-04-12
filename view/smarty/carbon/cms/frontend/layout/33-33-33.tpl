{include 'cms/helper/layout'}

{function layout_33_33_33 section=null widgets=null}

    {$blocks = []}
    {$blocks['1'] = 'grid__12 grid--bp-med__4'}
    {$blocks['2'] = 'grid__12 grid--bp-med__4'}
    {$blocks['3'] = 'grid__12 grid--bp-med__4'}

    {call renderLayout blocks=$blocks}

{/function}
