import { test, expect } from '@playwright/test';
import TMDB from '../src/model/tmdb.js';

// Does not require a browser to run, so we disable firefox and webkit
test.use({ browserName: 'chromium' });
test('TMDB API works fine', async () => {
    const data = await TMDB.getMovie(550);
    expect(data).toHaveProperty('original_title', 'Fight Club');

    const posterURL = await TMDB.getMoviePosterURL(550);
    expect(posterURL).toBe('https://image.tmdb.org/t/p/original/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg');
});