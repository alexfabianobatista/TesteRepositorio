unit UEtiquetaImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Buttons, Grids, DBGrids, Menus;

type
  TFEtiquetaImpressao = class(TForm)
    CdChapa: TClientDataSet;
    CdChapaDESC_CHAPA: TStringField;
    CdChapaCOD_CHAPA: TIntegerField;
    DsChapa: TDataSource;
    DsPeca: TDataSource;
    CdPeca: TClientDataSet;
    CdPecaCOD_CHAPA: TIntegerField;
    CdPecaCOD_PECA: TIntegerField;
    BtnConsultar: TBitBtn;
    OdArquivo: TOpenDialog;
    DbGChapa: TDBGrid;
    DbGPeca: TDBGrid;
    EArquivo: TEdit;
    BtnImprimirTudo: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    Peaselecionada1: TMenuItem;
    Peaavulsa1: TMenuItem;
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnImprimirTudoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Peaselecionada1Click(Sender: TObject);
    procedure Peaavulsa1Click(Sender: TObject);
  private
    wPecaDigitada: Integer;
    procedure imprimeEtiquetaAtual(wPeca: Integer = -1);
    procedure imprimeCabecalhoChapa;
    function getNumeroDaString(texto:String):String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEtiquetaImpressao: TFEtiquetaImpressao;

implementation

uses UBiblioteca, UPedido_cl, UOracle_cl, UEstoque_cl, UParamSistema_cl;

{$R *.dfm}

function A_Set_Darkness(darkness: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_CreatePrn(selection: integer; FileName: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Print_Out(width, height, copies, amount: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Text(x, y, ori, font, typee, hor_factor, ver_factor: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Barcode(x, y, ori: integer; typee: char; narrow, width, height: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Text_TrueType(x, y, FSize: integer; FType: pchar; Fspin, FWeight, FItalic, FUnline, FStrikeOut: integer; id_name, data: pchar; mem_mode: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Get_Graphic(x, y, mem_mode: integer; format: char; filename: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Draw_Box(mode, x, y, width, height, top, side: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Draw_Line(mode, x, y, width, height: integer): integer; stdcall; external 'WINPPLA.DLL';
procedure A_ClosePrn(); stdcall; external 'WINPPLA.DLL';
function A_Load_Graphic(x, y: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Clear_Memory(): integer; stdcall; external 'WINPPLA.DLL';

procedure TFEtiquetaImpressao.BtnConsultarClick(Sender: TObject);
var arq: TextFile;
  linha: string;
  wUltimaChapa: Integer;
  wContChapa : integer;
  wchapa : string;
begin
  wChapa := '0';
  wContChapa := 0;
  if OdArquivo.Execute then
  begin
    EArquivo.Text := OdArquivo.FileName;
    AssignFile(arq, OdArquivo.FileName);

    CdPeca.EmptyDataSet;
    CdChapa.EmptyDataSet;
    CdChapa.Close;
    CdChapa.Open;
    CdPeca.Close;
    CdPeca.Open;

    Reset(arq);
    ReadLn(arq, linha);

    If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
    Begin
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
    end;
    If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' then
    Begin
      ReadLn(arq, linha);
      while not Eof(arq) do
      begin
        ReadLn(arq, linha);

        if copy(linha,2,1) = ';' then
          wChapa := copy(linha,1,1);
        if copy(linha,3,1) = ';' then
          wChapa := copy(linha,1,2);

        if StrToInt(wChapa) <> wContChapa then
        Begin
          inc(wContChapa);
          CdChapa.Append;
          CdChapaDESC_CHAPA.Value := wChapa;
          CdChapaCOD_CHAPA.Value := StrToInt(wChapa);
          CdChapa.Post;
          wUltimaChapa := CdChapaCOD_CHAPA.Value;
          
          CdPeca.Append;
          CdPecaCOD_CHAPA.Value := wUltimaChapa;
          if Length(wChapa) = 1 then
          Begin
            if copy(Linha,7,1) = ';' then
              CdPecaCOD_PECA.Value := StrToInt(copy(linha,3,4));
            if copy(Linha,8,1) = ';' then
              CdPecaCOD_PECA.Value := StrToInt(copy(linha,3,5));
            if copy(Linha,9,1) = ';' then
              CdPecaCOD_PECA.Value := StrToInt(copy(linha,3,6));
          end;
          if Length(wChapa) = 2 then
          Begin
            if copy(Linha,8,1) = ';' then
              CdPecaCOD_PECA.Value := StrToInt(copy(linha,4,4));
            if copy(Linha,9,1) = ';' then
              CdPecaCOD_PECA.Value := StrToInt(copy(linha,4,5));
            if copy(Linha,10,1) = ';' then
              CdPecaCOD_PECA.Value := StrToInt(copy(linha,4,6));
          end;
          CdPeca.Post;
        end
        else
        begin
          CdPeca.Append;
          CdPecaCOD_CHAPA.Value := wUltimaChapa;
          if Length(wChapa) = 1 then
          Begin
            if copy(Linha,7,1) = ';' then
              CdPecaCOD_PECA.Value := StrToInt(copy(linha,3,4));
            if copy(Linha,8,1) = ';' then
              CdPecaCOD_PECA.Value := StrToInt(copy(linha,3,5));
            if copy(Linha,9,1) = ';' then
              CdPecaCOD_PECA.Value := StrToInt(copy(linha,3,6));
          end;
          if Length(wChapa) = 2 then
          Begin
            if copy(Linha,8,1) = ';' then
              CdPecaCOD_PECA.Value := StrToInt(copy(linha,4,4));
            if copy(Linha,9,1) = ';' then
              CdPecaCOD_PECA.Value := StrToInt(copy(linha,4,5));
            if copy(Linha,10,1) = ';' then
              CdPecaCOD_PECA.Value := StrToInt(copy(linha,4,6));
          end;
          CdPeca.Post;
        end;
      end;
    end;
    CloseFile(arq);
  end;
end;

procedure TFEtiquetaImpressao.BtnImprimirTudoClick(Sender: TObject);
begin
  CdChapa.First;
  while not CdChapa.Eof do
  begin
    imprimeCabecalhoChapa;

    CdPeca.First;
    while not CdPeca.Eof do
    begin
      imprimeEtiquetaAtual;
      CdPeca.Next;
    end;

    CdChapa.Next;
  end;
  CdChapa.First;
  CdPeca.First;
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'TEMPERMED') and
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'TEMPERFOZ')) then
    if (MessageDlg('Atualizar Estoque?',mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    Begin
      CdChapa.First;
      while not CdChapa.Eof do
      begin
        imprimeCabecalhoChapa;

        CdPeca.First;
        while not CdPeca.Eof do
        begin
          with DMPedido do
          Begin
            QEtiqueta.Close;
            QEtiqueta.SetVariable('COD_PECA', CdPecaCOD_PECA.Value);
            QEtiqueta.SetVariable('NUM_SERIE',StrToInt(DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA =''NUM_SERIE''')));
            QEtiqueta.Open;
            QEtiqueta.Last;
            DMEstoque.AtualizaEstoque(-2,1,StrToInt(QEtiquetaCOD_PRODUTO.Text),1,QEtiquetaQT_PEDIDO.Value*-1,0,0,0);
            CdPeca.Next;
          end;
        end;

        CdChapa.Next;
      end;
      CdChapa.First;
      CdPeca.First;
    end;
end;

procedure TFEtiquetaImpressao.imprimeCabecalhoChapa;
begin
  Sleep(750);

  A_CreatePrn(1, 'ppla.txt');
  A_Set_Darkness(12);
  A_Prn_Text(310, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(''));
  A_Prn_Text(250, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(''));
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
    A_Get_Graphic(80, 25, 2, 'B', pchar(ExtractFilePath(Application.ExeName) + 'TEMPER.bmp'));
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'TEMPERFOZ' then
        A_Prn_Text(250, 65, 3, 2, 0, 3, 3, 'n', 2, pchar('TEMPERFOZ'));
  A_Prn_Text(115, 40, 3, 2, 0, 3, 3, 'n', 2, pchar(''));
  A_Prn_Text(100, 75, 3, 2, 0, 2, 2, 'n', 2, pchar(''));
  A_Prn_Text(310, 110, 3, 4, 0, 1, 1, 'n', 2, pchar(''));
  A_Prn_Text(280, 190, 3, 4, 0, 1, 1, 'n', 2, pchar(''));
  A_Prn_Text(100, 190, 3, 4, 0, 1, 1, 'n', 2, pchar(''));
  A_Prn_Text(310, 205, 3, 2, 0, 1, 1, 'n', 2, pchar(''));
  A_Prn_Text(310, 240, 3, 2, 0, 2, 3, 'n', 2, pchar(''));
  A_Prn_Text(90, 240, 3, 3, 0, 1, 1, 'n', 2, pchar(''));
  A_Prn_Text(230, 150, 3, 5, 0, 1, 1, 'n', 2, pchar(CdChapaDESC_CHAPA.Value));
  A_Print_Out(1, 1, 1, 1);
  A_ClosePrn;
end;

procedure TFEtiquetaImpressao.imprimeEtiquetaAtual(wPeca: Integer = -1);
var wCodBarra, wCodBarra2, wObs, letras, l, caminho: string;
  i, j, k:integer;
  wSerie,wCodPeca : integer;
begin
  wSerie := StrToInt(DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA =''NUM_SERIE'''));
  if (wPeca = -1) then
    wCodPeca := StrToInt('0'+ DMOracle.BuscaNome('SELECT COD_PECA FROM TB_MATERIAL','NUM_SERIE='+IntToStr(wSerie)+' and COD_PECA='+CdPecaCOD_PECA.Text))
  else
    wCodPeca := StrToInt('0'+ DMOracle.BuscaNome('SELECT COD_PECA FROM TB_MATERIAL','NUM_SERIE='+IntToStr(wSerie)+' and COD_PECA='+IntToStr(wPeca)));
  If wCodPeca = 0 then
    wSerie := wSerie - 1;
  with DMPedido do
  begin
    QEtiqueta.Close;
    if (wPeca = -1) then
    Begin
      QEtiqueta.SetVariable('COD_PECA', CdPecaCOD_PECA.Value);
      QEtiqueta.SetVariable('NUM_SERIE',wSerie);
    end
    else
    Begin
      QEtiqueta.SetVariable('COD_PECA', wPeca);
      QEtiqueta.SetVariable('NUM_SERIE',wSerie);
    end;
    QEtiqueta.Open;
    QEtiqueta.Last;

    If QEtiquetaIND_TIPO_PRODUTO.Text = 'INDUSTRIAL' Then
    Begin
      wObs := Trim(QEtiquetaDESC_SERVICO.Text) + ' ' + Trim(QEtiquetaDESC_ACABAMENTO.Text) + ' ' +
        Trim(QEtiquetaDESC_CANTO.Text) + ' ' + Trim(QEtiquetaDESC_FORMA.Text);

      wCodBarra := FormatFloat('000000', StrToInt(Bib.LimpaNumero(QEtiquetaCOD_PECA.Text))) +
        '99' +
        FormatFloat('000', StrToInt(Bib.LimpaNumero(QEtiquetaNUM_SERIE.Text)));
      if(getNumeroDaString(QEtiquetaDESC_COMPLEMENTO.value) = '') then
        Exception.Create('A espessura da peça esta inválida, verifique o cadastro do produto!');
      wCodBarra2 := FormatFloat('0000000000', StrToInt(Bib.LimpaNumero(QEtiquetaCOD_PECA.Text))) +
      (getNumeroDaString(QEtiquetaDESC_COMPLEMENTO.value)+'0000') + '00010000';
      DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_CALCULO = ' + QuotedStr('S') + ' WHERE COD_PEDIDO_ITEM = ' + QEtiquetaCOD_PEDIDO_ITEM.Text);
      DMOracle.ExecutaSql('UPDATE TB_MATERIAL_QUEBRA SET DT_REPOSICAO = CAST(' + QuotedStr(DateToStr(DMOracle.DataHoraServ)) + ' AS TIMESTAMP) WHERE COD_MATERIAL = ' + QEtiquetaCOD_MATERIAL.Text);

      Sleep(750);

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'TEMPERMED' then
      Begin
        A_CreatePrn(1, 'ppla.txt');
        A_Set_Darkness(12);
        A_Prn_Text(395, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(QEtiquetanum_ordem_item.Text + '/' + QEtiquetanum_total_itens.Text));
        //if QEtiquetaIND_QUEBRA.Value = 'S' then //comentado marcos subst. pelo if abaixo
        if QEtiquetaQT_TOTAL_QUEBRAS.Value > 0 then
          A_Prn_Text(350, 018, 3, 3, 0, 1, 1, 'n', 2, pchar('R' + QEtiquetaQT_TOTAL_QUEBRAS.Text));
        A_Prn_Text(215, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(FormatDateTime('dd/MM/yyyy', QEtiquetaDT_EMISSAO.Value)));

        caminho := pchar(ExtractFilePath(Application.ExeName) + 'TEMPER.bmp');
        A_Get_Graphic(150, 35, 2, 'B', pchar(ExtractFilePath(Application.ExeName) + 'temper.bmp'));
        A_Prn_Text(115, 40, 3, 2, 0, 3, 3, 'n', 2, pchar(QEtiquetaCOD_PEDIDO_CAB.Text));
        A_Prn_Text(140, 75, 3, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaDESC_COMPLEMENTO.Text));
        A_Prn_Text(395, 110, 3, 4, 0, 1, 1, 'n', 2, pchar(Copy(Copy(QEtiquetaDESC_FANTASIA.Text, 1, 20) + '-' + QEtiquetaDESC_COMPLEMENTO_OBS.Text, 1, 35)));
        if QEtiquetaDESC_ESPECIFICACAO.Value = 'USINAGEM' then
          A_Prn_Text(40, 110, 3, 4, 0, 1, 1, 'n', 2, pchar('CE'));
        A_Prn_Text(220, 135, 3, 2, 0, 1, 2, 'n', 2, pchar(Trim(wObs)));
        A_Prn_Barcode(395, 170, 3, 'B', 0, 7, 40, 'N', 1, pchar(wCodBarra));

        A_Prn_Text(110, 150, 3, 3, 0, 1, 1, 'n', 2, pchar('ENTREGA'));
        A_Prn_Text(110, 170, 3, 3, 0, 1, 1, 'n', 2, pchar(FormatDateTime('dd/MM/yyyy', QEtiquetaDT_ENTREGA.Value)));

        A_Prn_Text(335, 225, 3, 4, 0, 1, 1, 'n', 2, pchar(QEtiquetaVAL_LARGURA.Text + ' x ' + QEtiquetaVAL_ALTURA.Text));
        A_Prn_Text(110, 225, 3, 4, 0, 1, 1, 'n', 2, pchar(FormatFloat('000000', StrToInt(Bib.LimpaNumero(QEtiquetaCOD_PECA.Text))) + Copy(QEtiquetaIND_TIPO.Text, 1, 1)));
        A_Prn_Text(390, 270, 3, 2, 0, 3, 3, 'n', 2, pchar(Copy(QEtiquetaDESC_REGIAO.Text, 1, 3)));
        A_Prn_Barcode(335, 280, 3, 'E', 0, 7, 40, 'N', 1, pchar(wCodBarra2));
 //       A_Prn_Text(90, 240, 3, 3, 0, 1, 1, 'n', 2, pchar(FormatDateTime('dd/MM/yyyy', QEtiquetaDT_EMISSAO.Value)));   
        A_Print_Out(1, 1, 1, 1);
        A_ClosePrn;
      end;
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'TEMPERFOZ' then
      Begin
      A_CreatePrn(1, 'ppla.txt');
        A_Set_Darkness(12);
        A_Prn_Text(320, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(QEtiquetanum_ordem_item.Text + '/' + QEtiquetanum_total_itens.Text));
        if QEtiquetaQT_TOTAL_QUEBRAS.Value > 0 then
          A_Prn_Text(250, 018, 3, 3, 0, 1, 1, 'n', 2, pchar('R' + QEtiquetaQT_TOTAL_QUEBRAS.Text));
        A_Prn_Text(250, 40, 3, 2, 0, 2, 2, 'n', 2, pchar('TEMPERFOZ'));
        A_Prn_Text(115, 40, 3, 2, 0, 3, 3, 'n', 2, pchar(QEtiquetaCOD_PEDIDO_CAB.Text));
        A_Prn_Text(100, 60, 3, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaDESC_COMPLEMENTO.Text));
        A_Prn_Text(100, 80, 3, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaIND_TIPO.Text));
        A_Prn_Text(310, 110, 3, 4, 0, 1, 1, 'n', 2, pchar(Copy(Copy(QEtiquetaDESC_FANTASIA.Text, 1, 14) + '-' + QEtiquetaDESC_COMPLEMENTO_OBS.Text, 1, 25)));
        A_Prn_Text(310, 130, 3, 2, 0, 2, 1, 'n', 2, pchar(Trim(wObs)));
        if QEtiquetaDESC_ESPECIFICACAO.Value = 'USINAGEM' then
          A_Prn_Text(40, 110, 3, 4, 0, 1, 1, 'n', 2, pchar('CE'));
        A_Prn_Text(250, 190, 3, 4, 0, 1, 1, 'n', 2, pchar(QEtiquetaVAL_LARGURA.Text + ' x ' + QEtiquetaVAL_ALTURA.Text));
        A_Prn_Text(90, 180, 3, 4, 0, 1, 1, 'n', 2, pchar(FormatFloat('000000', StrToInt(Bib.LimpaNumero(QEtiquetaCOD_PECA.Text)))));
        A_Prn_Text(90, 200, 3, 3, 0, 1, 1, 'n', 2, pchar(FormatDateTime('dd/MM/yyyy', QEtiquetaDT_EMISSAO.Value)));
        A_Prn_Barcode(250, 250, 3, 'B', 0, 7, 40, 'N', 1, pchar(wCodBarra));
        A_Prn_Text(310, 250, 3, 2, 0, 2, 3, 'n', 2, pchar(Copy(QEtiquetaDESC_REGIAO.Text, 1, 3))); 
        A_Print_Out(1, 1, 1, 1);
        A_ClosePrn;
      end;
    end
    else
    Begin
      wCodBarra := FormatFloat('000000', StrToInt(Bib.LimpaNumero(QEtiquetaCOD_PECA.Text))) +
                   '99' + FormatFloat('000', StrToInt(Bib.LimpaNumero(QEtiquetaNUM_SERIE.Text)));

      Sleep(250);
      A_CreatePrn(1, 'ppla.txt');
      A_Set_Darkness(12);
      A_Prn_Text(310, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(QEtiquetanum_ordem_item.Text + '/' + QEtiquetanum_total_itens.Text));
      if QEtiquetaIND_QUEBRA.Value = 'S' then
        A_Prn_Text(250, 018, 3, 3, 0, 1, 1, 'n', 2, pchar('R' + QEtiquetaQT_TOTAL_QUEBRAS.Text));
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'TEMPERMED' then
        A_Get_Graphic(125, 25, 2, 'B', pchar(ExtractFilePath(Application.ExeName) + 'TEMPER.bmp'))
      else
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'TEMPERFOZ' then
        A_Prn_Text(290, 55, 3, 2, 0, 3, 3, 'n', 2, pchar('TEMPERFOZ'));
      A_Prn_Text(115, 40, 3, 2, 0, 3, 3, 'n', 2, pchar(QEtiquetaCOD_PEDIDO_CAB.Text));
      A_Prn_Text(100, 75, 3, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaCOD_PECA.Text));
      A_Prn_Text(310, 110, 3, 4, 0, 1, 1, 'n', 2, pchar(Copy(Copy(QEtiquetaDESC_FANTASIA.Text, 1, 14) + '-' + QEtiquetaDESC_COMPLEMENTO_OBS.Text, 1, 25)));
      A_Prn_Barcode(300, 170, 3, 'B', 0, 7, 40, 'N', 1, pchar(wCodBarra));
      A_Prn_Text(295, 200, 3, 4, 0, 1, 1, 'n', 2, pchar(QEtiquetaDESC_PRODUTO.Text));
      A_Prn_Text(310, 240, 3, 2, 0, 2, 3, 'n', 2, pchar(Copy(QEtiquetaDESC_REGIAO.Text, 1, 3)));
      A_Prn_Text(90, 240, 3, 3, 0, 1, 1, 'n', 2, pchar(FormatDateTime('dd/MM/yyyy', QEtiquetaDT_EMISSAO.Value)));
      A_Print_Out(1, 1, 1, 1);
      A_ClosePrn;
    end;
  end;
end;

procedure TFEtiquetaImpressao.BitBtn2Click(Sender: TObject);
begin
  imprimeCabecalhoChapa;

  CdPeca.First;
  while not CdPeca.Eof do
  begin
    imprimeEtiquetaAtual;
    CdPeca.Next;
  end;
  CdPeca.First;
end;

procedure TFEtiquetaImpressao.BitBtn3Click(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFEtiquetaImpressao.Peaselecionada1Click(Sender: TObject);
begin
  imprimeEtiquetaAtual;
end;

procedure TFEtiquetaImpressao.Peaavulsa1Click(Sender: TObject);
begin
  wPecaDigitada := StrToInt(InputBox('Peça', 'Digite o número da peça: ', ''));
  imprimeEtiquetaAtual(wPecaDigitada);
end;

function TFEtiquetaImpressao.getNumeroDaString(texto:String):String;
  var i:integer;
    numero:string;
    achou:boolean;
begin
  i:=0;
  achou:=false;
  numero:='';
  while(i < Length(texto)+1) do
  begin
    if (texto[i] in ['0'..'9']) then
    begin
      achou:=true;
      numero := numero + texto[i];
      i := i + 1;
    end
    else if(achou) then
      break
    else
      i := i + 1;
  end;
    result := numero;
end;

end.
