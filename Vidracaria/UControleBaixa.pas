unit UControleBaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, UFmProduto, Grids, DBGrids, DBClient, DBCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFControleBaixa = class(TFTCadSimples)
    DBGrid1: TDBGrid;
    FmProduto1: TFmProduto;
    Label1: TLabel;
    MeCodChapa: TMaskEdit;
    EdChapa: TEdit;
    MELote: TMaskEdit;
    MEQtde: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    BtBaixar: TBitBtn;
    MeChapaInicial: TMaskEdit;
    MeChapaFinal: TMaskEdit;
    MeCalculo: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BtCalculo: TBitBtn;
    CdChapa: TClientDataSet;
    CdChapaDESC_CHAPA: TStringField;
    CdChapaCOD_CHAPA: TIntegerField;
    DsChapa: TDataSource;
    DsPeca: TDataSource;
    CdPeca: TClientDataSet;
    CdPecaCOD_CHAPA: TIntegerField;
    CdPecaCOD_PECA: TIntegerField;
    OdArquivo: TOpenDialog;
    ConsultaRastreamento1: TMenuItem;
    dsCHAPA2: TDataSource;
    RelatriodeRastreamento1: TMenuItem;
    procedure FmProduto1MeProdutoExit(Sender: TObject);
    procedure MeCodChapaExit(Sender: TObject);
    procedure BtBaixarClick(Sender: TObject);
    procedure BtCalculoClick(Sender: TObject);
    procedure ConsultaRastreamento1Click(Sender: TObject);
    procedure RelatriodeRastreamento1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleBaixa: TFControleBaixa;

implementation

uses UVidracaria_cl, UOracle_cl, UEstoque_cl, UBiblioteca, URastrearCad,
  UTela_cl, UVidracariaParam, URRastreamento;

{$R *.dfm}

procedure TFControleBaixa.FmProduto1MeProdutoExit(Sender: TObject);
begin
  inherited;
  dmvidracaria.QControleBaixa.Close;
  dmvidracaria.QControleBaixa.SetVariable('COD_PRODUTO',FmProduto1.MeProduto.Text);
  dmvidracaria.QControleBaixa.Open;
  FmProduto1.MeProdutoExit(Sender); 
end;

procedure TFControleBaixa.MeCodChapaExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodChapa.Text) <> '' then
    EdChapa.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO' , 'COD_PRODUTO ='+Trim(MeCodChapa.Text));
end;

procedure TFControleBaixa.BtBaixarClick(Sender: TObject);
var
wCont : Integer;
begin
  inherited;
  wCont := 0;
  if (Trim(MeCodChapa.Text) ='') or (Trim(EdChapa.Text) ='') or (Trim(Melote.Text) ='')
      or (Trim(MeQtde.Text) ='') or (MeQtde.Text ='0') or (Trim(MeChapaInicial.Text) = '')
      or (Trim(MeChapaFinal.Text) = '') or (Trim(MeCalculo.Text) = '') then
    Raise Exception.Create('Preencha todos os Campos!');
  DMEstoque.AtualizaEstoque(-2,1,StrToInt(MeCodChapa.Text),StrToInt(MeLote.Text),StrToInt(MeQtde.Text)*-1,0,0,0);
  ShowMessage('Estoque Atualizado!');
  dmvidracaria.QControleBaixa.Close;
  dmvidracaria.QControleBaixa.SetVariable('COD_PRODUTO',FmProduto1.MeProduto.Text);
  dmvidracaria.QControleBaixa.Open;

  CdChapa.First;
  while ((CdChapaCOD_CHAPA.Text <> Trim(MeChapaInicial.Text)) and (not CdChapa.Eof)) do
    CdChapa.Next;
  if CdChapa.Eof = true then
    Raise Exception.Create('Chapa não Encontrada! Verifique o arquivo do Cálculo');
  while ((CdChapaCOD_CHAPA.Value >= StrToInt(MeChapaInicial.Text)) and
        (CdChapaCOD_CHAPA.Value <= StrToInt(MeChapaFinal.Text))) and
        (wcont < StrToInt(MEQtde.Text)) do
  Begin
    CdPeca.First;
    while not CdPeca.Eof do
    begin
      DmVidracaria.QRastreamento.Open;
      DmVidracaria.QRastreamento.Insert;
      DmVidracaria.QRastreamentoCOD_CHAPA.Value    := StrToInt(MeCodChapa.Text);
      DmVidracaria.QRastreamentoCOD_LOTE.Value     := StrToInt(MELote.Text);
      DmVidracaria.QRastreamentoDT_BAIXA.Value     := DMOracle.DataServ;
      DmVidracaria.QRastreamentoDESC_CALCULO.Value := MeCalculo.Text;
      DmVidracaria.QRastreamentoCOD_PECA.Value     := FloatToStr(CdPecaCOD_PECA.Value);

      //DMOracle.ExecutaSql('UPDATE TB_MATERIAL SET COD_LOTE_RASTREADO ='+Trim(MeLote.Text)+' WHERE COD_PECA = '+ chr(39)+ CdPecaCOD_PECA.Text+chr(39));
      DmVidracaria.QRastreamento.Post;
      CdPeca.Next;
    end;
    inc(wCont);
    CdChapa.Next;
  end;
  DMOracle.DBCemapa.Commit;
  ShowMessage('Ok ');
  FmProduto1.MeProduto.SetFocus;                                                                
  MeCodChapa.Text:='';
  MELote.Text:='';
  EdChapa.Text:='';
  MEQtde.Text:='';
  MeChapaInicial.Text:='';
  MeChapaFinal.Text:='';
  MeCalculo.Text:='';
end;

procedure TFControleBaixa.BtCalculoClick(Sender: TObject);
var arq: TextFile;
  linha: string;
  wUltimaChapa: Integer;
begin
  if OdArquivo.Execute then
  begin
    MeCalculo.Text := OdArquivo.FileName;
    AssignFile(arq, OdArquivo.FileName);

    CdPeca.EmptyDataSet;
    CdChapa.EmptyDataSet;
    CdChapa.Close;
    CdChapa.Open;
    CdPeca.Close;
    CdPeca.Open;


    Reset(arq);
    ReadLn(arq, linha);
    while not Eof(arq) do
    begin
      ReadLn(arq, linha);

      if Trim(linha) = '' then
        Continue;
      if Trim(linha) = '* * * * *' then
        Exit;

      if ((Pos('/', linha) <> 0) and (Pos('x', linha) <> 0)) then
      begin
        CdChapa.Append;
        CdChapaDESC_CHAPA.Value := Trim(linha);
        CdChapaCOD_CHAPA.Value := StrToInt(Trim(Copy(linha, 0, Pos('/', linha) - 1)));
        CdChapa.Post;

        wUltimaChapa := CdChapaCOD_CHAPA.Value;
      end
      else
        if Bib.isInteger(Trim(linha)) then
        begin
          CdPeca.Append;
          CdPecaCOD_CHAPA.Value := wUltimaChapa;
          CdPecaCOD_PECA.Value := StrToInt(Trim(linha));
          CdPeca.Post;
        end;
    end;
    CloseFile(arq);
  end;
end;

procedure TFControleBaixa.ConsultaRastreamento1Click(Sender: TObject);
begin
  inherited;
  if FRastrearCad = nil then
    FRastrearCad := TFRastrearCad.Create(Application);
  FRastrearCad.ShowModal;
end;
{
 Autor: Junior
 Data : 16-AGO-2012
 Descrição: Criado o Relatório de Rastreamento que é feito no click do botão "Baixar e Rastrear Estoque"
}
procedure TFControleBaixa.RelatriodeRastreamento1Click(Sender: TObject);
begin
  inherited;
  if FVidracariaParam = nil then
    FVidracariaParam := TFVidracariaParam.Create(Application);
  FVidracariaParam.PGRelatorio.Pages[2].TabVisible := True;
  if FVidracariaParam.ShowModal = MrOk then
  with DmVidracaria do
  begin
    QRel_Rastreamento.Close;

    if Trim(FVidracariaParam.Fm2Produto.MeProduto.Text) = '' then
      QRel_Rastreamento.SetVariable('COD_CHAPA', Null)
    else
      QRel_Rastreamento.SetVariable('COD_CHAPA', FVidracariaParam.Fm2Produto.MeProduto.Text);

    if Trim(FVidracariaParam.Fm2Lote.MeLote.Text) = '' then
      QRel_Rastreamento.SetVariable('COD_LOTE',Null)
    else
      QRel_Rastreamento.SetVariable('COD_LOTE',FVidracariaParam.Fm2Lote.MeLote.Text);

    QRel_Rastreamento.Open;
    if FRRastreamento = nil then
      FRRastreamento := TFRRastreamento.Create(Application);

    if FVidracariaParam.RGPreview.ItemIndex = 0 then
      FRRastreamento.QRPrimario.Preview
    else
      FRRastreamento.QRPrimario.Print;
    QRel_Rastreamento.Close;
  end;
end;

end.
