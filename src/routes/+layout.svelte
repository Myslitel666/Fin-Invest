<script lang="ts">
	import '../app.css'
	import { ThemeProvider } from "svelte-elegant";
	import ContextMenu from '../components/layout/ContextMenu.svelte';

	let { children } = $props();
</script>

<ThemeProvider>
	<ContextMenu />
	<div class="app">
		<main>
			{@render children()}
		</main>
	</div>
</ThemeProvider>