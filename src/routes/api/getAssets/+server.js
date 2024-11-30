import pool from "../pool";

export async function GET() {
    const result = await pool.query('SELECT * FROM public.stock ORDER BY stockid ASC LIMIT 100');
    
    return new Response(JSON.stringify(result.rows), {
        headers: { 'Content-Type': 'application/json' },
        status: 200,
    });
}
