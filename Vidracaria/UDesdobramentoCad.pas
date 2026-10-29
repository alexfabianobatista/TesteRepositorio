unit UDesdobramentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants;

type
  TFDesdobramentoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    EmissoLotesClaspar1: TMenuItem;
    RelaoClaspar1: TMenuItem;
    procedure EmissoLotesClaspar1Click(Sender: TObject);
    procedure RelaoClaspar1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDesdobramentoCad: TFDesdobramentoCad;

implementation

uses UNotaSaida_cl, UTela_cl, UDesdobramento_ClasparCons, UNotaSaidaParam,
  ULotesClaspar, URNota_Claspar, URelatorioVenda_cl, UOracle_cl,
  UUsuario_cl;

{$R *.DFM}

procedure TFDesdobramentoCad.EmissoLotesClaspar1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[22].TabVisible := True;

  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME22Filial.Text),'VENDA');
    QRLotesClaspar.Close;
    QRLotesClaspar.SetVariable('DATA_I',FNotaSaidaParam.ME22DataI.Text);
    QRLotesClaspar.SetVariable('DATA_F',FNotaSaidaParam.ME22DataF.Text);

    If Trim(FNotaSaidaParam.ME22Filial.Text)= ''   then
      QRLotesClaspar.SetVariable('FILIAL',Null)
    Else
      QRLotesClaspar.SetVariable('FILIAL',Trim(FNotaSaidaParam.ME22Filial.Text));
    If Trim(FNotaSaidaParam.ME22NumeroI.Text)= ''   then
      QRLotesClaspar.SetVariable('Num_NotaI',Null)
    Else
      QRLotesClaspar.SetVariable('Num_NotaI',Trim(FNotaSaidaParam.ME22NumeroI.Text));
    If Trim(FNotaSaidaParam.ME22NumeroF.Text)= ''   then
      QRLotesClaspar.SetVariable('Num_NotaF',Null)
    Else
      QRLotesClaspar.SetVariable('Num_NotaF',Trim(FNotaSaidaParam.ME22NumeroF.Text));

    QRLotesClaspar.Open;
    FLotesClaspar.EmiteLotesClaspar;

    QRLotesClaspar.Close;
  End;

end;

procedure TFDesdobramentoCad.RelaoClaspar1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[17].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    QRClaspar.Close;
    If Trim(FNotaSaidaParam.ME17Lote.Text)= ''   then
      QRClaspar.SetVariable('LOTE',Null)
    Else
      QRClaspar.SetVariable('LOTE',Trim(FNotaSaidaParam.ME17Lote.Text));
    QRClaspar.Open;
    If FRNota_Claspar = Nil then
      FRNota_Claspar := TFRNota_Claspar.Create(Application);

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_Claspar.QRPrimario.Preview
    Else
      FRNota_Claspar.QRPrimario.Print;
    QRClaspar.Close;
  End;
end;

procedure TFDesdobramentoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(63);
end;

procedure TFDesdobramentoCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
   If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;

end;

end.
