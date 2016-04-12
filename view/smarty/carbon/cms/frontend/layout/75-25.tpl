{include 'cms/helper/layout'}

{function layout_75_25 section=null widgets=null}

    {$blocks = []}
    {$blocks['1'] = 'grid__12 grid--bp-med__9'}
    {$blocks['2'] = 'grid__12 grid--bp-med__3'}

    {call renderLayout blocks=$blocks}

{/function}
