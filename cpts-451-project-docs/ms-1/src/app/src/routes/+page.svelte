<script>
	import AppUI from './components/app-ui.svelte';

	let data = [];
</script>

<main>
	<AppUI />
	<footer>
		<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>
	</footer>
</main>

<style>
	main {
		min-width: 100%;
		min-height: 95vh;
	}

	footer {
		position: absolute;
		bottom: 0;
		width: 100%;
		height: 2.5rem;
		text-align: center;
		margin-top: 5%;
		margin-bottom: 1%;
	}
</style>
