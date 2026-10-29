unit UImporta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls;

type
  TFImporta = class(TFTCadSimples)
    OpenDialog1: TOpenDialog;
    BitBtn13: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    EdTotalNotas: TEdit;
    EdTotalItens: TEdit;
    RgEmpresa: TRadioGroup;
    procedure BitBtn13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImporta: TFImporta;

implementation

uses UOracle_cl, UImporta_cl, UProduto_cl, USequencia_cl, UUsuario_cl,
  UClasse_cl, UParamSistema_cl, UComissaoClasse_cl, UCadastro_cl,
  UVendedor_cl;

{$R *.DFM}

procedure TFImporta.BitBtn13Click(Sender: TObject);
var
   F          : TextFile;
   S,wTrib,wBrinde,wBonificacao,wFilial,wFinanceiro,wComercial,wNada,wLibera,wCadastro,wNovo : String;
   wContador,wQtNotas,wQtItens : Integer;
   wValor_cc,wTotPedido,wAux : Real;
begin
  inherited;
  S:= '';  // Inicializa valor da variavel.
  wQtNotas := 0;
  wQtItens := 0;
  OpenDialog1.InitialDir:='c:\';
  OpenDialog1.Filter:='txt';
  if OpenDialog1.Execute then
  begin
    try
      DMOracle.DBCemapa.StartTransaction;
      DMImporta.importaPedido(OpenDialog1.FileName, wQtNotas, wQtItens);

      DMOracle.DBCemapa.Commit;

      EdTotalNotas.Text := IntToStr(wQtNotas);
      EdTotalItens.Text := IntToStr(wQtItens);

      showmessage('Importação encerrada com Sucesso');
    except
      On E : Exception Do
       Begin
         DMOracle.DBCemapa.Rollback;
         Raise exception.Create(e.Message + Chr(13) + ' Erro na Importação');
       End;
    End;
  end;
end;

end.
