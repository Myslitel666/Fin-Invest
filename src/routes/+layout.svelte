<script lang="ts">
	import { ThemeProvider } from "svelte-elegant";
	let { children } = $props();
</script>

<ThemeProvider>
	<div class="app">
		<main>
			{@render children()}
		</main>
	</div>
</ThemeProvider>