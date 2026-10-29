unit PisCofinsM205;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM205 = class(TRegistro)
  private
  public
    NUM_CAMPO: string;
    COD_REC: string;
    VL_DEBITO: Double;

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM205.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_CAMPO, 2);
  addCampo(COD_REC, 6);
  addCampo(VL_DEBITO, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
 