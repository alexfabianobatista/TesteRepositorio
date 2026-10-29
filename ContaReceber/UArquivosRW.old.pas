unit UArquivosRW;

{$P+,S-,W-,R-}
{$C PRELOAD}

interface

uses StdCtrls, Dialogs, SysUtils, dbTables, USequencia_cl, UOracle_cl, UArqRem;

  Type TBBArq = Class(TArqRem)
      private
      public
   end;

   Type TSCIArq = Class(TArqRem)
       public
   end;

   Type TArquivoGen = Class(TArqRem)
       public
   end;

implementation

end.
