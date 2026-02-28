import { gdToRgba } from '@/lib/helpers';

describe('@/lib/helpers.ts', function () {
    describe('gdToRgba()', function () {
        it('should return the expected rgba', function () {
            expect(gdToRgba('#ffffff')).toBe('rgba(255, 255, 255, 1)');
            expect(gdToRgba('#00aabb')).toBe('rgba(0, 170, 187, 1)');
            expect(gdToRgba('#efefef')).toBe('rgba(239, 239, 239, 1)');
        });

        it('should ignore case', function () {
            expect(gdToRgba('#FF00A3')).toBe('rgba(255, 0, 163, 1)');
        });

        it('should allow alpha channel changes', function () {
            expect(gdToRgba('#ece5a8', 0.5)).toBe('rgba(236, 229, 168, 0.5)');
            expect(gdToRgba('#ece5a8', 0.1)).toBe('rgba(236, 229, 168, 0.1)');
            expect(gdToRgba('#000000', 0)).toBe('rgba(0, 0, 0, 0)');
        });

        it('should handle invalid strings', function () {
            expect(gdToRgba('')).toBe('');
            expect(gdToRgba('foobar')).toBe('foobar');
            expect(gdToRgba('#fff')).toBe('#fff');
            expect(gdToRgba('#')).toBe('#');
            expect(gdToRgba('#fffffy')).toBe('#fffffy');
        });
    });
});
