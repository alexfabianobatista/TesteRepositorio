unit UNotaSaidaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFNotaSaidaCons = class(TFTConsulta)
    BtConsCadastro: TBitBtn;
    Label2: TLabel;
    MENumNota: TMaskEdit;
    RGSituacao: TRadioGroup;
    MEDtInicial: TMaskEdit;
    Label3: TLabel;
    MEDtFinal: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    MeFilial: TMaskEdit;
    BtFilialCons: TBitBtn;
    RgOrdem: TRadioGroup;
    Label6: TLabel;
    MeSerie: TMaskEdit;
    BtConsSerie: TBitBtn;
    DBGrid2: TDBGrid;
    DSItensNfCons: TDataSource;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtFilialConsClick(Sender: TObject);
    procedure BtConsSerieClick(Sender: TObject);
    procedure METextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DSConsultaDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaSaidaCons: TFNotaSaidaCons;

implementation

uses UNotaSaida_cl, UCadastroCons, UCadastro_cl, UFilialCons, UFilial_cl,
  USerieCons, USerie_cl;

{$R *.DFM}

procedure TFNotaSaidaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    QNotaSaidaCons.Close;
    If Trim(METexto.Text) <> '' Then
      QNotaSaidaCons.SetVariable('CADASTRO',Trim(METexto.Text))
    Else
      QNotaSaidaCons.SetVariable('CADASTRO',Null);

    If Trim(MENumNota.Text) <> '' Then
      QNotaSaidaCons.SetVariable('NUM_NOTA',StrToInt(Trim(MENumNota.Text)))
    Else
      QNotaSaidaCons.SetVariable('NUM_NOTA',Null);

    If Trim(MeFilial.Text) <> '' Then
      QNotaSaidaCons.SetVariable('COD_FILIAL',StrToInt(Trim(MeFilial.Text)))
    Else
      QNotaSaidaCons.SetVariable('COD_FILIAL',Null);
    If Trim(MeSerie.Text) <> '' Then
      QNotaSaidaCons.SetVariable('COD_SERIE',Trim(MeSerie.Text))
    Else
      QNotaSaidaCons.SetVariable('COD_SERIE',Null);

    QNotaSaidaCons.SetVariable('DT_INICIAL',StrToDate(MEDtInicial.Text));
    QNotaSaidaCons.SetVariable('DT_FINAL',StrToDate(MEDtFinal.Text));
    QNotaSaidaCons.SetVariable('SITUACAO',FloatToStr(RGSituacao.ItemIndex));
    QNotaSaidaCons.SQL[QNotaSaidaCons.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case RgOrdem.ItemIndex of
      0 : QNotaSaidaCons.SQL.Add('ORDER BY DT_RECEBIMENTO');
      1 : QNotaSaidaCons.SQL.Add('ORDER BY NUM_NOTA');
      2 : QNotaSaidaCons.SQL.Add('ORDER BY NOME');
    End;
    QNotaSaidaCons.Open;
  End;
end;

procedure TFNotaSaidaCons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFNotaSaidaCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEDTInicial.Text := DateToStr(Date);
  MEDTFinal.Text := DateToStr(Date);
end;

procedure TFNotaSaidaCons.BtFilialConsClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFNotaSaidaCons.BtConsSerieClick(Sender: TObject);
begin
  inherited;
  If FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  If FSerieCons.ShowModal = mrOk then
    MeSerie.Text := DMSerie.QSerieConsCod_Serie.Text;

end;

procedure TFNotaSaidaCons.METextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     BtConsCadastro.Click;
end;

procedure TFNotaSaidaCons.DSConsultaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  DMNotaSaida.QItemNfCons.close;
  DMNotaSaida.QItemNfCons.SetVariable('Cod_Nota_Cab',DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value);
  DMNotaSaida.QItemNfCons.Open;
end;

end.
