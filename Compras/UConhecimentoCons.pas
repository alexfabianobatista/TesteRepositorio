unit UConhecimentoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFConhecimentoCons = class(TFTConsulta)
    BtConsCadastro: TBitBtn;
    Label2: TLabel;
    MENumNota: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    MEEntradaI: TMaskEdit;
    MEEntradaF: TMaskEdit;
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoCons: TFConhecimentoCons;

implementation

uses UNotaEntrada_cl, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFConhecimentoCons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFConhecimentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMNotaEntrada do
  Begin
    QConhecimentoCons.Close;
    QConhecimentoCons.SetVariable('DATA_I',StrToDate(MEEntradaI.Text));
    QConhecimentoCons.SetVariable('DATA_F',StrToDateTime(MEEntradaF.Text + ' 23:59:59'));

    If Trim(METexto.Text) <> '' Then
      QConhecimentoCons.SetVariable('CADASTRO',METexto.Text)
    Else
      QConhecimentoCons.SetVariable('CADASTRO',Null);

    If Trim(MENumNota.Text) <> '' Then
      QConhecimentoCons.SetVariable('NUM_NOTA',MENumNota.Text)
    Else
      QConhecimentoCons.SetVariable('NUM_NOTA',Null);

    QConhecimentoCons.Open;
  End;
end;

procedure TFConhecimentoCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEEntradaF.Text := DateToStr(Date);
  MEEntradaI.Text := DateToStr(Date-60);
end;

end.
