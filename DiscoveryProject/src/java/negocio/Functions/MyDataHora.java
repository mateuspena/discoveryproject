package negocio.Functions;

/**
 *
 * @author mateus
 */
public abstract class MyDataHora 
{
    /**
     * Converte uma string data (dd/mm/yyyy) para formato UTC (yyyy-mm-dd).
     * @param data String
     * @return utc - String
     */
    public static String toUTC(String data)
    {
        String[] dt = data.split("/");
        return( dt[2] + "-" + dt[1] + "-" + dt[0]);
    }
    
    /**
     * Converte uma string data UTC (yyyy-mm-dd) para formato brasileiro (dd/mm/yyyy).
     * @param data String
     * @return dtformat - String
     */
    public static String toDateFormat(String data)
    {
        String[] dt = data.split("-");
        return( dt[2] + "/" + dt[1] + "/" + dt[0]);
    }
}
