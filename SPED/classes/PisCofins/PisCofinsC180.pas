unit PisCofinsC180;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC180 = class(TRegistro)
  private
  public
    COD_MOD: string; //C(2)
    DT_DOC_INI: TDate; //N(8)
    DT_DOC_FIN: TDate; //N(8)
    COD_ITEM: string; //C(60)
    COD_NCM: string; //C(8)
    EX_IPI: string; //C(3)
    VL_TOT_ITEM: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC180 }

procedure TPisCofinsC180.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(DT_DOC_INI, 'D');
  addCampo(DT_DOC_FIN, 'D');
  addCampo(COD_ITEM, 60);
  addCampo(COD_NCM, 8);
  addCampo(EX_IPI, 3);
  addCampo(VL_TOT_ITEM, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
