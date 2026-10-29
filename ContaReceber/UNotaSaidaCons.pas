unit UNotaSaidaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, ExtCtrls, Mask, Buttons, Grids, DBGrids, Variants;

type
  TFNotaSaidaCons = class(TForm)
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    DBGridNotaCons: TDBGrid;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    METexto: TMaskEdit;
    BtConsCadastro: TBitBtn;
    MENumNota: TMaskEdit;
    RGSituacao: TRadioGroup;
    DSConsulta: TDataSource;
    Label5: TLabel;
    BtProcurar: TBitBtn;
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure DBGridNotaConsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaSaidaCons: TFNotaSaidaCons;

implementation

uses UCadastroCons, UContasReceber_cl, UCadastro_cl;

{$R *.DFM}

procedure TFNotaSaidaCons.BtConsCadastroClick(Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFNotaSaidaCons.BtProcurarClick(Sender: TObject);
begin
  With DMContasReceber do
  Begin
    QNotaSaidaCons.Close;
    if Trim(METexto.Text) <> '' Then
       QNotaSaidaCons.SetVariable('CADASTRO',METexto.Text)
    else
       QNotaSaidaCons.SetVariable('CADASTRO',Null);

    if Trim(MENumNota.Text) <> '' Then
      QNotaSaidaCons.SetVariable('NUM_NOTA',MENumNota.Text)
    else
      QNotaSaidaCons.SetVariable('NUM_NOTA',Null);

    QNotaSaidaCons.SetVariable('DT_INICIAL',MEDtInicial.Text);
    QNotaSaidaCons.SetVariable('DT_FINAL',MEDtFinal.Text + ' 23:59:59');
    QNotaSaidaCons.SetVariable('SITUACAO',RGSituacao.ItemIndex);

    QNotaSaidaCons.Open;
  end;
end;

procedure TFNotaSaidaCons.DBGridNotaConsDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
