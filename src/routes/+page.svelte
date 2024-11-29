<script>
    import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
    import { activeLink } from '../stores/activeLinkStore';

    function navigate() {
        const assets = '/assets'
        activeLink.set(assets);
        goto(assets);
    }

	onMount(() => {
		navigate();
	});
</script>
